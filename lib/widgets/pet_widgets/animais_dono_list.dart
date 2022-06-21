import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/models/pet_model.dart';
import 'package:tier/models/users_model.dart';

import '../../colors.dart';
import '../../views/pet_pages/pet_page.dart';
import '../favorite_button.dart';

class AnimaisDonoList extends StatelessWidget {
  AnimaisDonoList({
    Key? key,
    required this.nome,
    required this.imgUrl,
    required this.idade,
    required this.direita,
    required this.esquerda,
    required this.idUser,
    required this.pet,
    required this.user,
  }) : super(key: key);
  final String nome, idUser, imgUrl, idade;
  final double direita, esquerda;
  ModelPet pet;
  ModelUsers user;

  @override
  Widget build(BuildContext context) {
    String? idUsuarioatual = FirebaseAuth.instance.currentUser?.uid;
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) =>  PetPage(pet: pet, idUsuario: idUser),
            ));
      },
      child: Container(
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
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                idade == "1" ? "mês" : "meses",
                                style: GoogleFonts.poppins(
                                  color: AppColor.textosPretos2,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      FutureBuilder<ModelUsers?>(
                        future: readUser2(idUsuarioatual == null
                            ? '6GqG7AT0zqoOSIOrobTy'
                            : idUsuarioatual),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                                'Something went wrong!1 ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final user = snapshot.data;
                            return CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: favoritarPet(user!));
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
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
      ),
    );
  }

  Widget favoritarPet(ModelUsers user) {
    String? idUsuarioatual = FirebaseAuth.instance.currentUser?.uid;
    return StarButton(
        iconSize: 30,
        isStarred: user.petsFavoritos.contains(pet.idPet) ? true : false,
        // iconDisabledColor: Colors.white,
        valueChanged: (_isStarred) {
          ///addicionar funcao p favoritar no firebase
          if (_isStarred == true) {
            FirebaseFirestore.instance
                .collection('usuarios')
                .doc(idUsuarioatual)
                .update({
              "petsFavoritos": FieldValue.arrayUnion([pet.idPet]),
            });
            final docUser = FirebaseFirestore.instance
                .collection('usuarios')
                .doc(idUsuarioatual)
                .collection('favoritosPets')
                .doc();
            final fav = ModelFavoritosAnimais(
              idFav: docUser.id,
              idDono: pet.idUsuario,
              idPet: pet.idPet,
            );
            final json = fav.toJason();
            docUser.set(json);
          }
          if (_isStarred == false) {
            FirebaseFirestore.instance
                .collection('usuarios')
                .doc(idUsuarioatual)
                .update({
              "petsFavoritos": FieldValue.arrayRemove([pet.idPet]),
            });

            final docUser = FirebaseFirestore.instance
                .collection('favoritosPets')
                .doc(pet.idPet);
            docUser.delete();
          }
        });
  }
}
