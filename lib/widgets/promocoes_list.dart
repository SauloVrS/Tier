import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/produto_page.dart';

import '../firebase/loja_helper.dart';
import '../firebase/produto_helper.dart';

Widget streamProdutos({required String id}) {

  return StreamBuilder<List<Produto>>(
      stream: getPromos(id: id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final produtos = snapshot.data!;
          produtos.shuffle();
          return SizedBox(
            height: 240,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: produtos.map((produto) => promoList(produto, context, id)).toList(),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
  );
}

Widget streamIds() {

  return StreamBuilder<List<String>>(
      stream: getIds(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final ids = snapshot.data!;
          return SizedBox(
              height: 250,
              child: ListView(
                padding: const EdgeInsets.only(left: 15),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: ids.map((id) => streamProdutos(id: id)).toList(),
              )
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
  );

}

Widget promoList(Produto produto, BuildContext context, String id) {
  return GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProdutoPage(produto: produto, lojaId: id,))),
    child: Container(
      margin: const EdgeInsets.only(right: 20),
      width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 120,
              width: 110,
              margin: const EdgeInsets.only(top: 0, bottom: 10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    )
                  ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  produto.imgUrl,
                  fit: BoxFit.cover,
                ),
              )),
          Text(
            produto.nome,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ),
          const SizedBox(
            height: 5,
          ),
          !produto.promocao
              ? Container()
              : Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "R\$ ${produto.valor.toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 12, decoration: TextDecoration.lineThrough),
                  )
                ),
              ),
          const SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "R\$ ${produto.novoValor.toStringAsFixed(2)}",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 18),
              )
            ),
          ),
        ],
      ),
    ),
  );
}

Stream<List<String>> getIds() => FirebaseFirestore.instance
    .collection("lojas")
    .where("name", isNotEqualTo: "nome")
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) => Loja.fromJson(doc.data()).id).toList());

Stream<List<Produto>> getPromos({required String id}) =>
    FirebaseFirestore.instance
        .collection("lojas")
        .doc(id)
        .collection('produtos')
        .where("promocao", isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Produto.fromJson(doc.data())).toList());

// class PromoList extends StatelessWidget {
//   final String title, imgUrl;
//   final double price, newPrice;
//
//   const PromoList(
//       {Key? key,
//         required this.title,
//         required this.imgUrl,
//         required this.price,
//         required this.newPrice})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         margin: const EdgeInsets.only(right: 20),
//         width: 110,
//         child: Column(
//           children: [
//             Container(
//                 height: 120,
//                 width: 110,
//                 margin: const EdgeInsets.only(top: 20, bottom: 10),
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: const Offset(0, 1),
//                       )
//                     ]
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.network(
//                     imgUrl,
//                     fit: BoxFit.cover,
//                   ),
//                 )),
//             Text(
//               title.toString(),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "R\$ ${price.toString()}",
//                 style: const TextStyle(
//                     fontSize: 12, decoration: TextDecoration.lineThrough),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "R\$ ${newPrice.toString()}",
//                 style: const TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }