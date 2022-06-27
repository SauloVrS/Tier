import 'package:firebase_auth/firebase_auth.dart';
import 'package:tier/widgets/lojas_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/users_model.dart';
import 'loja_helper.dart';

class TierTest extends StatefulWidget {
  const TierTest({Key? key}) : super(key: key);

  @override
  State<TierTest> createState() => _TierTestState();
}

class _TierTestState extends State<TierTest> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<List<Loja>>(
              stream: readUsers(),
              builder: (context, snapshot){
              if(snapshot.hasError){
                return Text('Something went wrong! ${snapshot.error}');
              } else if(snapshot.hasData){
                final lojas = snapshot.data!;

                return

                  ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: lojas.map((loja) => lojaList(loja, 30, context)).toList(),
                );

              } else {
                return const Center(child: CircularProgressIndicator());
              }
              }
            ),
            Center(
              child: ElevatedButton(
                onPressed: () { criarLoja(); },
                child: const Text('Adicionar'),
              ),
            ),
        ]),
      ),
    );
  }


  Stream<List<Loja>> readUsers() => FirebaseFirestore.instance
      .collection("lojas")
      .where("nome", isNotEqualTo: "nome")
      //.orderBy("status", descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Loja.fromJson(doc.data())).toList());

  Future criarLoja() async {
    final docLoja = FirebaseFirestore.instance.collection('lojas').doc();

    final end = {
      'cep': '50452000',
      'rua': 'rua dos carcaras',
      'numero': 1897,
      'bairro': 'Kapora',
      'cidade': 'Fortaleza'
    };

    final loja = Loja(
      id: docLoja.id,
      nome: 'Casa das Rações',
      imgUrl: 'https://s3-sa-east-1.amazonaws.com/projetos-artes/fullsize%2F2018%2F02%2F25%2F18%2FLogo-233908_6769_184508336_1021210839.jpg',
      endereco: end,
      status: true,
      avaliacao: 4.9,
      taxa: 5,
      pedidoMin: 15,
      tempMax: 50,
      tempMin: 60,
      distancia: 2.8,
      tipoProdutos: ['Ração'],
    );

    final json = loja.toJson();

    await docLoja.set(json);

  }
}
