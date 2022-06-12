import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/main_lojas.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';
import 'package:tier/views/pet_pages/adocao-home.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:share_plus/share_plus.dart';

class Meu_cupom extends StatelessWidget {
  const Meu_cupom({Key? key}) : super(key: key);


  void share(){
    //Share.share("Share text");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text('MEU CÓDIGO',
              style: GoogleFonts.poppins(
                color: Color.fromRGBO(27, 27, 27, 0.8),
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){ Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => TelaPerfilUsuario(),
            ));
            },
            icon: const Icon( Icons.arrow_back_ios, color: Color(0xFF6E6E6E))
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width:  300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "images/meu_codigo.png",
                            )
                        )
                    ),
                  ),
                  const SizedBox(height: 40,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan( text: 'Indique o ', style: GoogleFonts.poppins( fontSize: 30, color: Colors.black),
                        children: <TextSpan> [
                          TextSpan( text: 'Tier', style: TextStyle(color: Colors.orangeAccent)),
                          TextSpan( text: ' para os ', style: TextStyle(color: Colors.black)),
                        ]
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan( text: ' amigos e ganhe', style: GoogleFonts.poppins( fontSize: 30, color: Colors.black)),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan( text: ' 100 pontos', style: GoogleFonts.poppins( fontSize: 30, color: Colors.orangeAccent)),
                  ),
                  const SizedBox(height: 20,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Compartilhe seu código com os \n',
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: AppColor.textosPretos3),
                        children: <TextSpan> [
                          TextSpan( text: 'amigos que ainda não tem Tier. \n'),
                          TextSpan( text: 'Ambos ganham 100 pontos!')
                        ]
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        height: 80,
                        width: (MediaQuery.of(context).size.width) - 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: AppColor.cinzaBranco,
                              ),
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Column(
                                  children: [

                                    RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        text: ' TX303V3BTT',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: AppColor.textosPretos3),
                                      ),
                                    ),

                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'copiar código',
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: AppColor.textosPretos1),

                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  const SizedBox(height: 30,),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            //share();
                          },
                          child: Text("Share Text"),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}