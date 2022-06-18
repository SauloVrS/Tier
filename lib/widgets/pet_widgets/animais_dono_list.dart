import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';


class AnimaisDonoList extends StatelessWidget {
  const AnimaisDonoList(
      {Key? key,
      required this.nome,
      required this.imgUrl,
      required this.idade,
      required this.direita,
      required this.esquerda,
      required this.idUser,
      })
      : super(key: key);
  final String nome,idUser, imgUrl, idade;
  final double direita, esquerda;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 50) / 2.05,
      height: 150,
      margin:
          EdgeInsets.only(left: esquerda, right: direita, top: 10, bottom: 10),
      //color: AppColor.amareloPrincipal,
      child: Column(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 50) / 2.4,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imgUrl))),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 50) / 2.4,
            height: 50,
            decoration: BoxDecoration(
                color: AppColor.cinzaBranco,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          nome,
                          style: GoogleFonts.poppins(
                            color: AppColor.textosPretos2,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              idade,
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
                    const Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () {
                        //controlar favorito
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.cinzaBranco,
                                blurRadius: 0.9,
                                offset: const Offset(1, 1),
                              ),
                              BoxShadow(
                                color: AppColor.cinzaBranco,
                                blurRadius: 0.9,
                                offset: const Offset(-1, 1),
                              ),
                            ]),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
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
