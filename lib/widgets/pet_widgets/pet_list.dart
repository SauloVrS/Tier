

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/widgets/auth_widgets/cadastro_page.dart';

import '../../models/pet_model.dart';
import '../../models/users_model.dart';

import '../../views/pet_pages/pet_page.dart';
import '../favorite_button.dart';


class PetList extends StatelessWidget {
  final ModelPet pet;
  final String idUsuario;
  final ModelUsers user;

  PetList({Key? key,required this.pet, required this.idUsuario, required this.user

  }) : super(key: key);

  String? idUsuarioatual = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => PetPage(pet: pet, idUsuario: idUsuario,))),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 1.15,
                height: MediaQuery.of(context).size.height / 5.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(pet.fotoPet)),
                )),
            Container(
              padding:
              EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
              width: MediaQuery.of(context).size.width / 1.15,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                color: Color(0xffe5e5e5).withOpacity(0.7),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            pet.nomePet,
                            style: GoogleFonts.poppins(
                                fontSize:
                                MediaQuery.of(context).size.width / 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 15,
                          ),
                          Row(
                            children: [
                              Text(
                                pet.idadePet,
                                style: GoogleFonts.poppins(
                                    fontSize:
                                    MediaQuery.of(context).size.width / 25),
                              ),
                              SizedBox(width: 4,),
                              Text(pet.idadePet == "1" ? "mês" : "meses",style: GoogleFonts.poppins(
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 25,

                              ),),
                            ],
                          ),
                          Text(
                            pet.typePet,
                            style: GoogleFonts.poppins(fontSize: 0.1),
                          ),

                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 1, right: 1, bottom: 1, top: 1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: favoritarPet(),




                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: MediaQuery.of(context).size.height / 38,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        pet.distanciaPet,
                        style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width / 26),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }

  Widget favoritarPet() {
    return StarButton(
      iconSize: 40,

        isStarred: user.petsFavoritos.contains(pet.idPet)?
        true : false ,
        // iconDisabledColor: Colors.white,
        valueChanged: (_isStarred)  {

          ///addicionar funcao p favoritar no firebase
          if (_isStarred == true) {

            FirebaseFirestore.instance
                .collection('usuarios')
                .doc(idUsuarioatual)
                .update({
              "petsFavoritos": FieldValue.arrayUnion([pet.idPet]),
            });
            final docUser = FirebaseFirestore.instance.collection('usuarios').doc(idUsuarioatual).collection('favoritosPets').doc();
            final fav = ModelFavoritosAnimais(
            idFav: docUser.id,
            idDono: pet.idUsuario,
            idPet: pet.idPet,
            );
            final json = fav.toJason();
            docUser.set(json);

          }
          if(_isStarred == false){
            FirebaseFirestore.instance
                .collection('usuarios')
                .doc(idUsuarioatual)
                .update({
              "petsFavoritos": FieldValue.arrayRemove([pet.idPet]),
            });

            final docUser = FirebaseFirestore.instance
                .collection('favoritosPets')
                .doc(pet.idPet)
            ;
            docUser.delete();
          }


        }

    );
  }



}
