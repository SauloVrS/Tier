import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

class MeusAnimaisList extends StatelessWidget {
  const MeusAnimaisList(
      {Key? key,
        required this.nome,
        required this.imgUrl,
        required this.idade,
        required this.direita,
        required this.esquerda,
        required this.idUser,
      }) : super(key: key);
  final String? nome, imgUrl, idade, idUser;
  final double direita, esquerda;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 50)/2,
      height: 150,
      margin: EdgeInsets.only(left: esquerda, right: direita, top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 50)/2,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imgUrl!)
                )
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 50)/2,
            height: 50,
            decoration: BoxDecoration(
                color: AppColor.cinzaBranco,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          nome!,
                          style: GoogleFonts.poppins(
                            color: AppColor.textosPretos2,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Row(
                          children: [
                            Text(
                              idade!,
                              style: GoogleFonts.poppins(
                                color: AppColor.textosPretos2,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 4,),
                            Text(idade! == "1" ? "mês" : "meses",style: GoogleFonts.poppins(
                              color: AppColor.textosPretos2,
                              fontSize: 12,

                            ),)
                          ],
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox(),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}