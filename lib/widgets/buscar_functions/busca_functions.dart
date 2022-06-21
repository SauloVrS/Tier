import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tier/views/loja_page.dart';

import '../../firebase/loja_helper.dart';
import '../../firebase/produto_helper.dart';
import '../../models/users_model.dart';
import '../lojas_list.dart';
import '../promocoes_list.dart';
String? idUsuario = FirebaseAuth.instance.currentUser?.uid;

Widget streamProdutosBusca({required String id, required String text, required BuildContext context}) {

  return StreamBuilder<List<Produto>>(
      stream: getProdutosBusca(id: id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final produtos = snapshot.data!;
          List<Produto> newProdutos = produtos.where((element) => element.nome.toLowerCase().contains(text.toLowerCase())).toList();
          // produtos.forEach((element) {
          //   if(element.nome == text){
          //     newProdutos.add(element);
          //   }
          // });
          return SizedBox(
            //height: 240,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              //scrollDirection: Axis.horizontal,
              children: newProdutos.map((produto) => prodList(produto, id, context)).toList(),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
  );
}

Widget streamIdsBusca(String text) {

  return StreamBuilder<List<String>>(
      stream: getIds(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final ids = snapshot.data!;
          return SizedBox(
              //height: 250,
              child: ListView(
                padding: const EdgeInsets.only(left: 15),
                shrinkWrap: true,
                //scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: ids.map((id) => streamProdutosBusca(id: id, text: text, context: context)).toList(),
              )
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
  );

}

Stream<List<Produto>> getProdutosBusca({required String id}) =>
    FirebaseFirestore.instance
        .collection("lojas")
        .doc(id)
        .collection('produtos')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Produto.fromJson(doc.data())).toList());

// parte da loja

Widget streamLojasBusca(String text){

  return FutureBuilder<ModelUsers?>(
      future: readUser2(idUsuario == null ? '6GqG7AT0zqoOSIOrobTy' : idUsuario!),
  builder: (context, snapshot){
  if(snapshot.hasError){
  return Text('Something went wrong!1 ${snapshot.error}');
  } else if(snapshot.hasData){
  final user = snapshot.data;
  return StreamBuilder<List<Loja>>(
      stream: readUsers(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text('Something went wrong! ${snapshot.error}');
        } else if(snapshot.hasData){
          final lojas = snapshot.data!;
          List<Loja> newLojas = lojas.where((element) => element.nome.toLowerCase().contains(text.toLowerCase())).toList();
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: newLojas.map((loja) => lojaList(loja, 30, context,user!)).toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
  );
  } else {
    return const Center(child: CircularProgressIndicator());
  }
  },
  );
}