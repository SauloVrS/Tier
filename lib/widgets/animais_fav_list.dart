import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/pet_pages/pet_page.dart';

import '../colors.dart';
import '../models/pet_model.dart';


class AnimaisList extends StatelessWidget {
   AnimaisList({Key? key,
    required this.nome,
    required this.imgUrl,
    required this.idade,
    required this.direita,
    required this.esquerda,
    required this.idFav,
    required this.idUser,
    required this.pet,
  }) : super(key: key);
  final String? nome, imgUrl, idade, idFav, idUser;
  final double direita, esquerda;
  ModelPet? pet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(
            builder: (context) =>  PetPage(pet: pet!, idUsuario: idUser!),
        ));
      },
      child: Container(
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
                      Column(
                        children: [
                          Text(
                            nome!,
                            style: GoogleFonts.poppins(
                              color: AppColor.textosPretos2,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                      GestureDetector(
                        onTap: (){
                          //remover favorito
                          final docUser = FirebaseFirestore.instance
                              .collection('usuarios')
                              .doc(idUser)
                              .collection('favoritosPets')
                              .doc(idFav)
                          ;
                          docUser.delete();
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
                              ]
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
