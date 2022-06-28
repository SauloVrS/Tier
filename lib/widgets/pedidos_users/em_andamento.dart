import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/pedidos_users/acompanhe_pedido.dart';
import 'package:tier/widgets/carrinho_widgets/carrinho_functions.dart';
import 'package:tier/widgets/pedidos_users/pedidos_users_functions.dart';

import '../../firebase/loja_helper.dart';
import '../../firebase/pedido_helper.dart';
import '../../firebase/produto_helper.dart';

class EmAndamento extends StatefulWidget {
  const EmAndamento({Key? key}) : super(key: key);

  @override
  State<EmAndamento> createState() => _EmAndamentoState();
}

class _EmAndamentoState extends State<EmAndamento> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Pedido>>(
        stream: readPedidos(user!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final pedidos = snapshot.data!;
            final pedidoss = pedidos.where((pedido) => pedido.status != 'Finalizado' && pedido.status != 'Cancelado');
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: pedidoss.map((pedido) => PedidosCard(pedido)).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

  Widget PedidosCard(Pedido pedido) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey,
              width: 0.5,
          ),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
            child: Row(
              children: [
                Expanded(child: streamLojas(pedido)),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AcompanhePedido(pedido: pedido))),
                  child: const Icon(Icons.arrow_forward_ios, size: 18,),
                )
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '${pedido.status!}...',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 11,
                      color: Colors.black),
                )
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: pedido.carrinho!.map((compra) => streamProduto(pedido.idLoja!, compra['idProduto'], compra['quantidade'])).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Previsão de Entrega:',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),
                      )
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      '12:30 - 13:00',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color:Colors.black
                        ),
                      )
                    )
                  ],
                ),
                Text(
                  'R\$ ${pedido.valor!.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color:Colors.black
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget streamLojas(Pedido pedido){
    return Container(
      child: StreamBuilder<List<Loja>>(
          stream: rLoja(pedido.idLoja!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final lojas = snapshot.data!;
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: lojas.map((loja) => lojaCard(loja)).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }

  Widget lojaCard(Loja loja){
    return Container(
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                loja.imgUrl,
                height: 35,
                width: 35,
                fit: BoxFit.cover,
                color: !loja.status
                    ? Colors.white.withOpacity(0.25)
                    : Colors.white.withOpacity(1),
                colorBlendMode: BlendMode.modulate,
              )
          ),
          const SizedBox(width: 5,),
          Text(loja.nome,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: loja.status ? Colors.black : Colors.grey),
              )
          ),
          const SizedBox(width: 5,),
          Container(
              margin: const EdgeInsets.only(right: 2),
              child: Icon(
                Icons.star,
                color:
                loja.status ? Colors.yellowAccent : Colors.yellow,
                size: 14,
              )),
          Text(
              loja.avaliacao.toString(),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 10,
                    color: Colors.yellow),
              )
          ),
        ],
      ),
    );
  }

  Widget streamProduto(String idLoja, String idProduto, num qnt){
    return Container(
      child: StreamBuilder<List<Produto>>(
          stream: rProduto(idLoja, idProduto),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final produtos = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: produtos.map((produto) =>
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 8,
                            child: Text(
                              qnt.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: Text(
                              produto.nome,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                            ),
                      ),
                          ),
                    ])
                  ).toList(),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
      )
    );
  }

  Stream<List<Loja>> rLoja(String idLoja) => FirebaseFirestore.instance
      .collection("lojas")
      .where('id', isEqualTo: idLoja)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Loja.fromJson(doc.data())).toList());
  
  Stream<List<Produto>> rProduto(String idLoja, String idProduto) => FirebaseFirestore.instance
      .collection("lojas")
      .doc(idLoja)
      .collection('produtos')
      .where('id', isEqualTo: idProduto)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Produto.fromJson(doc.data())).toList());

}
