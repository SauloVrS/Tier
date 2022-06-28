import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tier/colors.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../perfil_pages/perfil_usuario.dart';

class Idiomas extends StatelessWidget {
  const Idiomas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Text(AppLocalizations.of(context)!.language_settings,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
          margin: const EdgeInsets.fromLTRB(100, 40, 100, 0),
          height: 200,
          width:  300,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/language.png",
                  )
              )
          ),
        ),
            const SizedBox(height: 30,),
              Text(AppLocalizations.of(context)!.in_your_phone_go_to_settings,
              style: GoogleFonts.poppins(
              fontSize: 20,
              color: AppColor.textosPretos3)),
              Text(AppLocalizations.of(context)!.search_languages_and_change,
              style: GoogleFonts.poppins(
              fontSize: 20,
              color: AppColor.textosPretos3)),
              Text(AppLocalizations.of(context)!.acccording_to_your_preference,
                  style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: AppColor.textosPretos3)),
          ],
        )
    );
  }
}
