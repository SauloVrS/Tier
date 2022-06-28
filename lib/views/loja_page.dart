import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/models/users_model.dart';
import 'package:tier/views/produto_page.dart';

import '../firebase/loja_helper.dart';
import '../firebase/produto_helper.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/favorite_button.dart';
import '../widgets/promocoes_list.dart';

class LojaPage extends StatefulWidget {
  final Loja loja;

  const LojaPage({Key? key, required this.loja}) : super(key: key);

  @override
  State<LojaPage> createState() => _LojaPageState();
}

class _LojaPageState extends State<LojaPage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            titleLoja(widget.loja, context),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              color: AppColor.cinzaBranco,
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
            ofertasLoja(widget.loja, context),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              color: AppColor.cinzaBranco,
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
            Column(
                children: widget.loja.tipoProdutos
                    .map((tipo) =>
                        listTipoProduto(tipo, widget.loja.id, context))
                    .toList())
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(
      //   pagina: 'lojas',
      // ),
    );
  }

  Widget ofertasLoja(Loja loja, BuildContext context, {bool isLoja = false}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('Ofertas',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ))),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 250,
            child: ListView(
              padding: const EdgeInsets.only(left: 15),
              scrollDirection: Axis.horizontal,
              children: [
                streamProdutos(id: loja.id),
              ],
            ),
          )
          //streamProdutos(id: loja.id),
        ],
      ),
    );
  }

  Widget titleLoja(Loja loja, BuildContext context, {bool isLoja = false}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            descLoja(loja, 0, context),
            Expanded(child: Container()),
            favoritarLoja(loja)
          ],
        ),
        Row(
          children: [
            Text(
              'Pedido Minimo: ',
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 10, color: AppColor.cinzaMedio)),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'R\$ ${loja.pedidoMin.toStringAsFixed(2)}',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ]),
    );
  }

  Widget listTipoProduto(String typeProd, String id, BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              typeProd,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
            ),
            const SizedBox(
              height: 15,
            ),
            streamProdByType(id: id, type: typeProd),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        color: AppColor.cinzaBranco,
        width: MediaQuery.of(context).size.width,
        height: 1,
      ),
    ]);
  }
}

Widget descLoja(Loja loja, int espacamento, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
    height: 80,
    //width: MediaQuery.of(context).size.width - (espacamento),
    child: Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              loja.imgUrl,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
              color: !loja.status
                  ? Colors.white.withOpacity(0.25)
                  : Colors.white.withOpacity(1),
              colorBlendMode: BlendMode.modulate,
            )),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loja.nome,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: loja.status ? Colors.black : Colors.grey),
                )),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: Icon(
                      Icons.star,
                      color: loja.status ? Colors.yellowAccent : Colors.yellow,
                      size: 14,
                    )),
                Text(loja.avaliacao.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.circle,
                        color: loja.status ? Colors.black : Colors.grey,
                        size: 5)),
                Text('${loja.distancia.toString()} km',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.circle,
                        color: loja.status ? Colors.black : Colors.grey,
                        size: 5)),
                Text(loja.status ? "aberto" : "fechado",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                    '${loja.tempMin.toString()} - ${loja.tempMax.toString()} min',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.circle,
                        color: loja.status ? Colors.black : Colors.grey,
                        size: 5)),
                Text('R\$ ${loja.taxa.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget streamProdByType({required String id, required String type}) {
  return StreamBuilder<List<Produto>>(
      stream: getProdByType(id: id, type: type),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final produtos = snapshot.data!;
          return SizedBox(
            //height: 140,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              //scrollDirection: Axis.vertical,
              children: produtos
                  .map((produto) => prodList(produto, id, context))
                  .toList(),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
}

Widget prodList(Produto produto, String id, BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProdutoPage(
                  produto: produto,
                  lojaId: id,
                ))),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(top: 0, bottom: 10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  produto.imgUrl,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produto.nome,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 14,
                  )),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    produto.promocao
                        ? Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "R\$ ${produto.valor.toStringAsFixed(2)}",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough),
                                )),
                          )
                        : Container(
                            width: 0,
                          ),
                    produto.promocao
                        ? const SizedBox(
                            width: 10,
                          )
                        : const SizedBox(
                            width: 0,
                          ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          produto.promocao
                              ? "R\$ ${produto.novoValor.toStringAsFixed(2)}"
                              : "R\$ ${produto.valor.toStringAsFixed(2)}",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 18),
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget favoritarLoja(Loja loja) {
  String? idUsuarioatual = FirebaseAuth.instance.currentUser?.uid;
  return FutureBuilder<ModelUsers?>(
    future: readUser2(
        idUsuarioatual == null ? '6GqG7AT0zqoOSIOrobTy' : idUsuarioatual),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong!1 ${snapshot.error}');
      } else if (snapshot.hasData) {
        final user = snapshot.data;
        return StarButton(
            iconSize: 50,
            isStarred: user!.lojasFavoritas.contains(loja.id) ? true : false,
            // iconDisabledColor: Colors.white,
            valueChanged: (_isStarred) {
              if (user.idUsuario == '6GqG7AT0zqoOSIOrobTy' &&
                  _isStarred == true) {}

              ///addicionar funcao p favoritar no firebase
              if (_isStarred == true) {
                FirebaseFirestore.instance
                    .collection('usuarios')
                    .doc(idUsuarioatual)
                    .update({
                  "lojasFavoritas": FieldValue.arrayUnion([loja.id]),
                });
                final docUser = FirebaseFirestore.instance
                    .collection('usuarios')
                    .doc(idUsuarioatual)
                    .collection('favoritosLojas')
                    .doc();
                final fav = ModelFavoritosLojas(
                  idFav: docUser.id,
                  idLoja: loja.id,
                );
                final json = fav.toJason();
                docUser.set(json);
              }
              if (_isStarred == false) {
                FirebaseFirestore.instance
                    .collection('usuarios')
                    .doc(idUsuarioatual)
                    .update({
                  "lojasFavoritas": FieldValue.arrayRemove([loja.id]),
                });

                final docUser = FirebaseFirestore.instance
                    .collection('favoritosLojas')
                    .doc(loja.id);
                docUser.delete();
              }
            });
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
