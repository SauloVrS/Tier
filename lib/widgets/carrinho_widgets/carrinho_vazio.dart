import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/fav_lojas.dart';

Widget carrinhoVazio(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset('images/carrinho_vazio.png'),
          ),
          Text(
            'Carrinho Vazio',
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Você ainda não possui produtos no seu carrinho.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
          Text(
            'Acesse seus favoritos ou encontre na busca.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const FavLojas2()), (route) => false);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: AppColor.amareloPrincipal,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                child: Text(
                  'Ir para favoritos',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
