import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../main_lojas.dart';
import '../perfil_pages/perfil_usuario.dart';

class Ajuda extends StatefulWidget {
  const Ajuda({Key? key}) : super(key: key);

  @override
  State<Ajuda> createState() => _AjudaState();
}

_callNumber() async{
  const number = '088996317567'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

class _AjudaState extends State<Ajuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Text('Ajuda',
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
                onPressed: (){ Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TelaPerfilUsuario(),
                ));
                },
                icon: const Icon( Icons.arrow_back_ios, color: Color(0xFF6E6E6E))
            )
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan( text: ' Ligue para nosso SAC', style: GoogleFonts.poppins( fontSize: 22, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 30,),

            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (widget) => _callNumber(),//colocar opção de ligar
                    )
                );
              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColor.amareloPrincipal.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.cinzaBranco,
                        blurRadius: 0.8,
                        offset: const Offset(2, 2),
                      ),
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ligar',
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
        )

    );

  }
}