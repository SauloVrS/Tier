import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/firebase/pedido_helper.dart';

import '../../firebase/loja_helper.dart';
import '../../firebase/produto_helper.dart';

class AcompanheAndamento extends StatefulWidget {
  final Pedido pedido;
  const AcompanheAndamento({Key? key, required this.pedido}) : super(key: key);

  @override
  State<AcompanheAndamento> createState() => _AcompanheAndamentoState();
}

class _AcompanheAndamentoState extends State<AcompanheAndamento> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            blocoStatus(widget.pedido),
            const SizedBox(height: 10,),
            codigoPedido(),
            const SizedBox(height: 25,),
            mapEndereco(context),
            PedidosCard(widget.pedido)
          ],
        ),
      ),
    );
  }

  Widget blocoStatus(Pedido pedido){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Text(
              'Previsão de Entrega:',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor.cinzaClaro
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
          ),
          const SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                  color: AppColor.cinzaClaro,
                  border: Border.all(
                    color: AppColor.cinzaClaro,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 5,
                width: pedido.status == 'Em andamento' ? MediaQuery.of(context).size.width/3 : 2*MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration(
                  color: AppColor.cinzaescuroAppBar,
                  border: Border.all(
                    color: AppColor.cinzaescuroAppBar,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: AppColor.cinzaClaro,
                size: 5,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                pedido.status == 'Em andamento' ? 'Seu pedido está sendo separado' : 'Seu pedido está em rota',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.cinzaClaro
                  ),
                )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget codigoPedido(){
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
            width: MediaQuery.of(context).size.width-30,
            color: AppColor.textosPretos2,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Código de confirmação',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget mapEndereco(BuildContext context){
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('./images/greymap.jpg', fit: BoxFit.cover,),
              ),
              const SizedBox(height: 60,)
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.cinzaClaro, width: 0.8),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Entregar em:',
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 7,),
                  Text(
                    '${widget.pedido.endereco!.rua}, ${widget.pedido.endereco!.numero}',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 7,),
                  Text(
                    '${widget.pedido.endereco!.bairro}  -  ${widget.pedido.endereco!.cidade}',
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              )
          )
        ],
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
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0, bottom: 5),
            child: Text(
              'Destalhes do pedido',
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
            child: Row(
              children: [
                Expanded(child: streamLojas(pedido)),
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
                        'Total da compra:',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColor.cinzaClaro
                          ),
                        )
                    ),
                    const SizedBox(height: 5,),
                    Text(
                        'R\$ ${pedido.valor!.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 300 ? 22 : 15,
                              fontWeight: FontWeight.w600,
                              color:Colors.black
                          ),
                        )
                    )
                  ],
                ),
                const SizedBox(width: 10,),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Pagar na entrega',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.cinzaClaro
                              ),
                            )
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          child: Text(
                              pedido.pagamento!,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width > 300 ? 20 : 15,
                                    fontWeight: FontWeight.w600,
                                    color:Colors.black
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
