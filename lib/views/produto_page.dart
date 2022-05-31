import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tier/firebase/loja_helper.dart';
import 'package:tier/widgets/carrinho_widgets/carrinho_functions.dart';
import 'package:tier/widgets/carrinho_widgets/modal_loja_diferente.dart';

import '../colors.dart';
import '../firebase/produto_helper.dart';
//import '../widgets/bottom_nav_bar.dart';

class ProdutoPage extends StatefulWidget {
  final Produto produto;
  final String lojaId;
  const ProdutoPage({Key? key, required this.produto, required this.lojaId})
      : super(key: key);

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  int qnt = 1;

  aumentar() {
    setState(() {
      qnt++;
    });
  }

  diminuir() {
    setState(() {
      if (qnt == 1) {
        qnt = 1;
      } else {
        qnt--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: AppColor.cinzaescuroAppBar,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Image.network(
                    widget.produto.imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  color: AppColor.cinzaBranco,
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    widget.produto.nome,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.produto.promocao
                          ? Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "R\$ ${widget.produto.valor.toStringAsFixed(2)}",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 13,
                                        decoration: TextDecoration.lineThrough),
                                  )),
                            )
                          : Container(),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            widget.produto.promocao
                                ? "R\$ ${widget.produto.novoValor.toStringAsFixed(2)}"
                                : "R\$ ${widget.produto.valor.toStringAsFixed(2)}",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 5),
                  child: StreamBuilder<Loja>(
                      stream: getLojaById(widget.lojaId),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              'Something went wrong! ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          final loja = snapshot.data!;
                          return lojaDados(loja);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(color: AppColor.cinzaBranco),
                        child: Text(
                          'Adicionar à Assinatura',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Column(children: [
          Container(
            color: AppColor.cinzaBranco,
            width: MediaQuery.of(context).size.width,
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                qntProd(),
                const SizedBox(
                  width: 15,
                ),
                Expanded(child: addProd(context))
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget lojaDados(Loja loja) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColor.cinzaBranco, style: BorderStyle.solid)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_bag,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                loja.nome,
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.star_rounded,
                color: AppColor.amareloPrincipal,
                size: 15,
              ),
              Text(
                loja.avaliacao.toStringAsFixed(1),
                style: GoogleFonts.poppins(
                    color: AppColor.amareloPrincipal, fontSize: 12),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                  '${loja.tempMin.toString()} - ${loja.tempMax.toString()} min',
                  style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 12, color: Colors.grey),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Icon(Icons.circle, color: Colors.grey, size: 5)),
              Text('R\$ ${loja.taxa.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 12, color: Colors.grey),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget addProd(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColor.cinzaBranco, style: BorderStyle.solid)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              final aux = await verificaLoja(widget.lojaId, "André");
              final index = await verificaProduto(widget.produto.id, "André");
              if (index >= 0) {
                final num valor = widget.produto.promocao ? widget.produto.novoValor : widget.produto.valor;
                final produto = ShopProd(idProduto: widget.produto.id, idLoja: widget.lojaId, quantidade: qnt, valor: valor);
                mudarQnt('André', index, qnt, produto.toJson());
                Navigator.of(context).pop();
              } else {
                if(aux == 1){
                  final num valor = widget.produto.promocao ? widget.produto.novoValor : widget.produto.valor;
                  final produto = ShopProd(idProduto: widget.produto.id, idLoja: widget.lojaId, quantidade: qnt, valor: valor);
                  addCarrinho("André", produto.toJson());
                  Navigator.of(context).pop();
                } else {
                  return showMaterialModalBottomSheet(
                      expand: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => ModalLojaDiferente(user: 'André', qnt: qnt, lojaId: widget.lojaId, produto: widget.produto,)
                  );
                }
              }
            },
            child: Text(
              'Adicionar',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, color: AppColor.cobre),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.produto.promocao
                ? 'R\$ ${(qnt * widget.produto.novoValor).toStringAsFixed(2)}'
                : 'R\$ ${(qnt * widget.produto.valor).toStringAsFixed(2)}',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
  }

  Widget qntProd() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColor.cinzaBranco, style: BorderStyle.solid)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => diminuir(),
            child: const Icon(Icons.remove_rounded),
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
            onTap: () => aumentar(),
            child: const Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
