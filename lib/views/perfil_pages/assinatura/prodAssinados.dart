import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/perfil_pages/assinatura/assinatura_second.dart';

import '../../../colors.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../main_lojas.dart';

class ProdAssinados extends StatefulWidget {
  const ProdAssinados({Key? key}) : super(key: key);

  @override
  State<ProdAssinados> createState() => _ProdAssinadosState();
}

class _ProdAssinadosState extends State<ProdAssinados> {
  String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Container(
          child: Text(
            'PRODUTOS ASSINADOS',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              color: Color.fromRGBO(167, 166, 166, 0.2),
              height: 1.2,
            ),
            preferredSize: const Size.fromHeight(1.2)),
      ),
      body: StreamBuilder<List<AssinaturaDados>>(
          stream: readAssinaturas(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Soomething went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final assinatura = snapshot.data!;
              if (assinatura.isNotEmpty) {
                return ListView(
                  children: assinatura.map(buildAssinatura).toList(),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("images/img_fav_lojas.png"))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Você ainda não tem produtos assinados...',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Procure seu produto necessário\n',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: AppColor.textosPretos3),
                              children: const [
                                TextSpan(
                                  text: 'e assine agora mesmo',
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainLojas(),
                                ));
                          },
                          child: Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                                color:
                                    AppColor.amareloPrincipal.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.cinzaBranco,
                                    blurRadius: 0.8,
                                    offset: const Offset(2, 2),
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ir para Lojas',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.textoBranco,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      bottomNavigationBar: const BottomNavBar(pagina: 'perfil'),
    );
  }

  Widget buildAssinatura(AssinaturaDados assin) => GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            children: [
              Container(
                  height: 100,
                  width: 100,
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
                      assin.imgUrl,
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
                      assin.nomeProd,
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
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("a cada ${assin.periodo} semanas",
                              //"R\$ ${assin.valor.toStringAsFixed(2)}",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("R\$ ${assin.valor.toStringAsFixed(2)}",
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

  Stream<List<AssinaturaDados>> readAssinaturas() => FirebaseFirestore.instance
      .collection('usuarios')
      .doc(currentUserId)
      .collection('assinatura')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => AssinaturaDados.fromJson(doc.data()))
          .toList());
}

// Stream<List<User>> readUsers() =>
//     FirebaseFirestore.instance.collection('usarios').snapshots().map((snapshot) =>
//         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
