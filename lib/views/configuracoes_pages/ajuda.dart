import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            Container(
              height: 250,
              width:  300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/central_atendimento.png",
                      )
                  )
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan( text: AppLocalizations.of(context)!.calloursac, style: GoogleFonts.poppins( fontSize: 22, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 30,),

        ElevatedButton(
          child: Text(AppLocalizations.of(context)!.call),
          onPressed: (){
            _callNumber();
          },
          style: ElevatedButton.styleFrom(
              primary: AppColor.amareloEscuro,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle:
              GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.textoBranco,)),
        ),
          ],
        )

    );

  }
}