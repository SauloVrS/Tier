import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/firebase/loja_helper.dart';

import '../../colors.dart';
import '../../models/users_model.dart';
import '../../widgets/lojas_list.dart';

class TypeProd extends StatefulWidget {
  final String type;
  const TypeProd({Key? key, required this.type}) : super(key: key);

  @override
  State<TypeProd> createState() => _TypeProdState();
}

class _TypeProdState extends State<TypeProd> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type,
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: AppColor.cinzaescuroAppBar,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<List<Loja>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final lojas = snapshot.data!;
              final realLojas = lojas.where((element) => element.tipoProdutos.contains(widget.type)).toList();
              return  FutureBuilder<ModelUsers?>(
                  future: readUser2(idUsuario == null ? '6GqG7AT0zqoOSIOrobTy' : idUsuario!),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('Something went wrong!1 ${snapshot.error}');
                    } else if(snapshot.hasData){
                      final user = snapshot.data;

                return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: realLojas.map((loja) => lojaList(loja, 30, context)).toList(),
              );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}

Stream<List<Loja>> getAllLojas() => FirebaseFirestore.instance
    .collection("lojas")
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) => Loja.fromJson(doc.data())).toList());
