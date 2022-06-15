
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tier/firebase/pedido_helper.dart';
import 'package:tier/widgets/carrinho_widgets/carrinho_functions.dart';
import 'package:tier/widgets/carrinho_widgets/metodo_pagamento.dart';
import 'package:tier/widgets/carrinho_widgets/modal_excluir_item.dart';

import '../../colors.dart';
import '../../firebase/produto_helper.dart';

class Carrinho extends StatefulWidget {
  final List list;
  final BuildContext context;
  const Carrinho({Key? key, required this.list, required this.context}) : super(key: key);

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  num subtotal = 0;
  num taxa = 0;
  num total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubtotal("André");
    getTaxa(widget.list[0]['idLoja']).then((value) =>
        setState((){
          taxa = value[0];
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: widget.list.map((e) => carrinhoItens(e['idLoja'], e['idProduto'], e['quantidade'], context)).toList(),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
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
                          'Aplicar cupons',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    )
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Subtotal',
                        style: GoogleFonts.poppins(
                            color: Colors.grey
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'R\$ ${subtotal.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(
                        'Taxa de entrega',
                        style: GoogleFonts.poppins(
                            color: Colors.grey
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'R\$ ${taxa.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Endereco endereco = Endereco(cidade: 'Fortaleza', bairro: 'Antonio Bezerra', cep: '60000000', numero: 60, rua: 'Rua das margaridas');
                Pedido pedido = Pedido(carrinho: widget.list, idLoja: widget.list[0]['idLoja'], idUser: 'test', valor: total, endereco: endereco);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MetodoDePagamento(pedido: pedido)));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    color: AppColor.amareloEscuro,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Selecionar forma de pagamento',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  getSubtotal(String user) async {
    var _ref = FirebaseDatabase.instance.ref('users/$user/Carrinho');

    _ref.onValue.listen((DatabaseEvent event) {
      setState(() {
        List list_aux = (event.snapshot.value ?? []) as List;
        subtotal = 0;
        list_aux.forEach((element) {
          subtotal += element["valor"] * element['quantidade'];
        });
        total = taxa + subtotal;
      });
    });

    _ref.onChildChanged.listen((DatabaseEvent event) {
      setState(() {
        List list_aux = (event.snapshot.value ?? []) as List;
        subtotal = 0;
        list_aux.forEach((element) {
          subtotal += element["valor"] * element['quantidade'];
        });
        total = taxa + subtotal;
      });
    });

  }

}


Widget carrinhoItens(String idLoja, String idProduto, int quantidade, BuildContext context) {
  return StreamBuilder<List<Produto>>(
    stream: getProduto(idLoja, idProduto),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong! ${snapshot.error}');
      } else if (snapshot.hasData) {
        final produtos = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: 0.5
              )
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: produtos.map((produto) => eachProduto(produto, quantidade, context, idLoja)).toList(),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}

Widget eachProduto(Produto produto, int qnt, BuildContext context, String idLoja) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: MediaQuery.of(context).size.width - 15,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: Image.network(produto.imgUrl, fit: BoxFit.cover,),
            ),
            GestureDetector(
              onTap: () async {
                const String user = 'André';
                final index = await verificaProduto(produto.id, user);
                apagarProduto(user, index);
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                child: const Icon(Icons.fiber_manual_record, size:25, color: Colors.black54),
              ),
            ),
            GestureDetector(
              onTap: () async {
                const String user = 'André';
                final index = await verificaProduto(produto.id, user);
                apagarProduto(user, index);
              },
              child: Container(
                margin: const EdgeInsets.all(8.5),
                child: const Icon(Icons.clear, size:16, color: Colors.white),
              ),
            )
          ]
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  produto.nome,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 13
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  qntProds(qnt, idLoja, produto, produto.id, context),
                  //Expanded(child: Container(),),
                  Expanded(
                    child: produto.promocao
                        ? Text('R\$ ${(produto.novoValor*qnt).toStringAsFixed(2).replaceAll('.', ',')}', textAlign: TextAlign.end, style: GoogleFonts.poppins(fontWeight: FontWeight.w600), overflow: TextOverflow.fade, )
                        : Text('R\$ ${(produto.valor*qnt).toStringAsFixed(2).replaceAll('.', ',')}', textAlign: TextAlign.end, style: GoogleFonts.poppins(fontWeight: FontWeight.w600), overflow: TextOverflow.fade,),
                  ),
                  const SizedBox(width: 5,),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget qntProds(int qnt, String idLoja, Produto prod, idProd, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.cinzaBranco, style: BorderStyle.solid)),
    child: Row(
      children: [
        GestureDetector(
          onTap: () async {
            if( qnt - 1 == 0 ) {
              const String user = 'André';
              final index = await verificaProduto(prod.id, user);
              return showMaterialModalBottomSheet(
                  expand: false,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) =>  ModalDeleteItem(user: user, index: index)
              );
            }
            final novaQnt = qnt - 1;
            alterarQntCarrinho(novaQnt, prod, "André", idLoja);
          },
          child: const Icon(Icons.remove_rounded, size: 16),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            qnt.toString(),
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 15,
                )),
          ),
        ),
        GestureDetector(
          onTap: () async {
            final novaQnt = qnt + 1;
            alterarQntCarrinho(novaQnt, prod, "André", idLoja);
          },
          child: const Icon(Icons.add_rounded, size: 16,),
        ),
      ],
    ),
  );
}

void alterarQntCarrinho(int qnt, Produto prod, String user, String idLoja) async {
  if(qnt > 0){
    final index = await verificaProduto(prod.id, user);
    if(index >= 0){
      print('chegou aqui');
      final num valor = prod.promocao ? prod.novoValor : prod.valor;
      final produto = ShopProd(idProduto: prod.id, idLoja: idLoja, quantidade: qnt, valor: valor);
      mudarQnt(user, index, qnt, produto.toJson());
    }
  }
}