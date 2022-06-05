import 'dart:ffi';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/auth_page.dart';
import 'package:tier/widgets/auth_widgets/cadastro_page.dart';
import 'package:tier/widgets/auth_widgets/login_page.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({Key? key}) : super(key: key);

  @override
  State<RecuperarSenha> createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            toolbarHeight: MediaQuery.of(context).size.height / 4,
            centerTitle: true,
            title: const Center(
              child: Image(
                image: AssetImage("images/img.png"),
              ),
            ),
            backgroundColor: AppColor.textoBranco,
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 4.0, color: AppColor.amareloPrincipal),
                  insets: EdgeInsets.symmetric(horizontal: 30.0)),
              tabs: [
                Tab(
                  child: Text(
                    'Recuperação de senha',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: AppColor.textosPretos3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: AppColor.cinzaBranco,
          body: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 4.0),
                      child: IconButton(
                        iconSize: MediaQuery.of(context).size.width / 7,
                        icon: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: AppColor.textosPretos3,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => authPage()));
                        },
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Esqueceu \na senha?',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: AppColor.amareloPrincipal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFFFFFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: Icon(Icons.mail,
                                color: AppColor.cinzaescuroAppBar),
                            labelText: '         Digite seu endereço e-mail',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppColor.cinzaclaroAppBar,
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 20.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '* Mandaremos um e-mail para você\n redefinir sua senha',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColor.cinzaclaroAppBar,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: Row(
                  children: [
                    Text(
                      'Enviar Código',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: AppColor.cinzaclaroAppBar,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    IconButton(
                        iconSize: MediaQuery.of(context).size.height / 12,
                        onPressed: () {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(
                                  email: _emailController.text)
                              .then((value) => print("email enviado!"))
                              .catchError((e) => print(e.toString()));
                        },
                        icon: Icon(
                          Icons.arrow_circle_right_sharp,
                          color: AppColor.amareloEscuro,
                        ))
                  ],
                ),
              )
            ]),
          ),
        ),
      );
}
