import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/auth_page.dart';
import 'package:tier/views/configuracoes_pages/ajuda.dart';
import 'package:tier/views/configuracoes_pages/cadastre_sua_loja.dart';
import 'package:tier/views/configuracoes_pages/idiomas.dart';
import 'package:tier/views/configuracoes_pages/politicas_de_uso.dart';
import 'package:tier/views/configuracoes_pages/sobre.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  _Configuracoes createState() => _Configuracoes();
}

class _Configuracoes extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              //color: Colors.amber.withOpacity(0.4),
              margin: EdgeInsets.only(top: 70, bottom: 30, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          //color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(5, 5),
                              color: AppColor.cinzaBranco,
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(-5, -5),
                              color: AppColor.cinzaBranco,
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(-5, 5),
                              color: AppColor.cinzaBranco,
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(5, -5),
                              color: AppColor.cinzaBranco,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: AppColor.background,
                          foregroundColor: AppColor.textosPretos2,
                          child: Icon(Icons.perm_identity), //trocar firebase
                          //imagem: colocar background imagem no lugar de child
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width - 125,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Nome', //firebase aqui
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Idiomas()));
              },
              child: Container(
                height: 60,
                child: Column(
                  children: [
                    Container(
                      height: 1,
                      color: AppColor.cinzaClaro.withOpacity(0.6),
                    ),
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Configurações de idiomas',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColor.cinzaClaro.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Ajuda()));
              },
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Central de ajuda',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColor.cinzaClaro.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Politicas_uso()));
              },
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Políticas de uso',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColor.cinzaClaro.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cadastro_Loja()));
              },
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Cadastre sua loja',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColor.cinzaClaro.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Sobre()));
              },
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Sobre',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColor.cinzaClaro.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => authPage()));
              },
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Sair',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColor.cinzaClaro.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'perfil'),
    );
  }
}
