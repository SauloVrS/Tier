import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tier/widgets/buscar_functions/busca_functions.dart';

import '../firebase/produto_helper.dart';
import '../widgets/promocoes_list.dart';
import 'loja_page.dart';

class ListaItens extends StatefulWidget {
  final String text;
  const ListaItens({Key? key, required this.text}) : super(key: key);

  @override
  State<ListaItens> createState() => _ListaItensState();
}

class _ListaItensState extends State<ListaItens> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Filtro(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text('Resultados Semelhantes a ${widget.text}',
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),),
          ),
          streamIdsBusca(widget.text)
          //streamProdByType(id: 'gWPjxX3aRPSOykSLQbfg', type: 'Ração')
          //ListView(
            //shrinkWrap: true,
            //children: const [
              //LojaWidget(
                //imagem: 'imagens/racao1.jpg',
              //),
            //],
          //)
        ],
      ),
    );
  }
}

// Widget streamSearch({required String id}) {
//
//   return StreamBuilder<List<Produto>>(
//       stream: getPromos(id: id),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong! ${snapshot.error}');
//         } else if (snapshot.hasData) {
//           final produtos = snapshot.data!;
//           produtos.shuffle();
//           return SizedBox(
//             height: 240,
//             child: ListView(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               children: produtos.map((produto) => promoList(produto, context, id)).toList(),
//             ),
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       }
//   );
// }
//
// Widget streamSearchIds() {
//
//   return StreamBuilder<List<String>>(
//       stream: getIds(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong! ${snapshot.error}');
//         } else if (snapshot.hasData) {
//           final ids = snapshot.data!;
//           return SizedBox(
//               height: 250,
//               child: ListView(
//                 padding: const EdgeInsets.only(left: 15),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 children: ids.map((id) => streamSearch(id: id)).toList(),
//               )
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       }
//   );
//
// }



