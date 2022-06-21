import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/models/users_model.dart';
import 'package:tier/views/pet_pages/perfil_dono_pet.dart';

import '../../models/pet_model.dart';
import '../../widgets/favorite_button.dart';
import 'adocao-home.dart';


class PetPage extends StatefulWidget {
  final ModelPet pet;

  final String idUsuario;

  const PetPage({Key? key, required this.pet, required this.idUsuario})
      : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xEFECECD5),
      body: Stack(
        children: [

          ///image
          Positioned(
              left: 0,
              right: 0,
              child: Container(

                width: double.maxFinite,
                height: MediaQuery
                    .of(context)
                    .size
                    .width / 1.8,

                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.pet.fotoPet
                        )
                    )
                ),
              )),

          ///button to back
          Positioned(
              top: 45,
              left: 20,
              right: 330,
              child:IconButton(

                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AdocaoHome(),
                      ));
                },
                icon: Icon(Icons.arrow_back,size: 30,color: Colors.black.withOpacity(0.8),),
              ),
          ),

          ///information
          Positioned(
              left: 0,
              right: 0,
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 4.2,
              child: Container(
                padding: EdgeInsets.only(left: 18, right: 18, top: 18,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffe5e5e3),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(widget.pet.nomePet, style: GoogleFonts.poppins(
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 13, fontWeight: FontWeight.w700),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.place_outlined, size: 18,),
                                SizedBox(width: 4,),
                                Text(widget.pet.distanciaPet,
                                  style: GoogleFonts.poppins(
                                      fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 23),),

                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 3, right: 3, bottom: 3, top: 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: FutureBuilder<ModelUsers?>(
    future: readUser2(idUsuario == null ? '6GqG7AT0zqoOSIOrobTy' : idUsuario!),
    builder: (context, snapshot){
    if(snapshot.hasError){
    return Text('Something went wrong!1 ${snapshot.error}');
    } else if(snapshot.hasData){
    final user = snapshot.data;
    return favoritarPet(user!, widget.pet);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
    },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .width / 15,),
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery
                          .of(context)
                          .size
                          .width / 30, right: MediaQuery
                          .of(context)
                          .size
                          .width / 30, bottom: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: MediaQuery
                                .of(context)
                                .size
                                .width / 40, bottom: MediaQuery
                                .of(context)
                                .size
                                .width / 40, left: MediaQuery
                                .of(context)
                                .size
                                .width / 40, right: MediaQuery
                                .of(context)
                                .size
                                .width / 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery
                                  .of(context)
                                  .size
                                  .width / 15),
                              color: Color(0xFFffb761),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, bottom: 4, right: 10, top: 4),
                              child: Column(

                                children: [
                                  Text(widget.pet.generoPet,
                                    style: GoogleFonts.poppins(
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .width / 25,
                                        fontWeight: FontWeight.w600),),
                                  Text("Gênero", style: GoogleFonts.poppins(
                                      fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 30),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery
                              .of(context)
                              .size
                              .width / 22,),
                          Container(
                            padding: EdgeInsets.only(top: MediaQuery
                                .of(context)
                                .size
                                .width / 30, bottom: MediaQuery
                                .of(context)
                                .size
                                .width / 30, left: MediaQuery
                                .of(context)
                                .size
                                .width / 30, right: MediaQuery
                                .of(context)
                                .size
                                .width / 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery
                                  .of(context)
                                  .size
                                  .width / 15),
                              color: Color(0xFFffb761),
                            ),
                            child: Column(

                              children: [
                                Row(
                                  children: [
                                    Text(widget.pet.idadePet,
                                      style: GoogleFonts.poppins(
                                          fontSize: MediaQuery
                                              .of(context)
                                              .size
                                              .width / 23,
                                          fontWeight: FontWeight.w600),),
                                    SizedBox(width: 4,),
                                    Text(widget.pet.idadePet == "1" ? "mês" : "meses",style: GoogleFonts.poppins(
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .width / 23,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),
                                Text("Idade", style: GoogleFonts.poppins(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 28),)
                              ],
                            ),
                          ),
                          SizedBox(width: MediaQuery
                              .of(context)
                              .size
                              .width / 22,),
                          Container(
                            padding: EdgeInsets.only(top: MediaQuery
                                .of(context)
                                .size
                                .width / 30, bottom: MediaQuery
                                .of(context)
                                .size
                                .width / 30, left: MediaQuery
                                .of(context)
                                .size
                                .width / 30, right: MediaQuery
                                .of(context)
                                .size
                                .width / 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery
                                  .of(context)
                                  .size
                                  .width / 15),
                              color: Color(0xFFffb761),
                            ),
                            child: Column(

                              children: [
                                Text("Pequeno", style: GoogleFonts.poppins(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 23,
                                    fontWeight: FontWeight.w600),),
                                Text("Porte", style: GoogleFonts.poppins(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 28),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),

                    ///informacoes do dono

                    streamInfoDono(id: widget.pet.idUsuario),











                    //botao de adotar
                    Container(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 30, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFffb761),
                      ),
                      child: Text("Adotar",
                        style: GoogleFonts.poppins(fontSize: MediaQuery
                            .of(context)
                            .size
                            .width / 20),),
                    ),
                    SizedBox(height: 500,)
                  ],


                ),
              ))
        ],
      ),
    );
  }


  Widget streamInfoDono({required String id}) {
    return FutureBuilder<ModelUsers?>(
      future: readUser(id),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData){
          final users = snapshot.data;
          return infoDono(users!, users.idUsuario!, context) ;
        } else{

          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }






  Widget infoDono(ModelUsers user, String id, BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .width / 40, bottom: MediaQuery
                .of(context)
                .size
                .width / 40, left: MediaQuery
                .of(context)
                .size
                .width / 40, right: MediaQuery
                .of(context)
                .size
                .width / 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 32,
                  child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(400),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              user.fotoUsuario!
                          )
                      )
                  ),
                ),),
                SizedBox(width: MediaQuery
                    .of(context)
                    .size
                    .width / 35,),
                Column(
                  children: [
                    Text(user.nomeUsuario!,
                      style: GoogleFonts.poppins(fontSize: MediaQuery
                          .of(context)
                          .size
                          .width / 20, fontWeight: FontWeight.w600),),
                    Text("Doador",
                      style: GoogleFonts.poppins(fontSize: MediaQuery
                          .of(context)
                          .size
                          .width / 33, fontWeight: FontWeight.w400),),

                  ],
                ),
                SizedBox(width: MediaQuery
                    .of(context)
                    .size
                    .width / 10,),
                GestureDetector(
                  onTap: () =>
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              PerfilDonoPet(idUsuario: user.idUsuario!, user: user,))),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFFc4c4c4),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Ver perfil", style: GoogleFonts
                        .poppins(fontSize: MediaQuery
                        .of(context)
                        .size
                        .width / 30, fontWeight: FontWeight.w500),),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          //descricao do dono
          Padding(
            padding: const EdgeInsets.only(
                left: 11, right: 11, top: 11, bottom: 0),
            child: Text(user.descricaoUsuario!,
              style: GoogleFonts.poppins(fontSize: MediaQuery
                  .of(context)
                  .size
                  .width / 25),),
          ),
          Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  Text("Descrição pet:", style: GoogleFonts.poppins(fontSize: MediaQuery
                      .of(context)
                      .size
                      .width / 25)),
                  SizedBox(width: 4,),
                  Text(widget.pet.descricaoPet,
                      style: GoogleFonts.poppins(fontSize: MediaQuery
                          .of(context)
                          .size
                          .width / 25)),

                  SizedBox(width: 10,),
                  /*Text("Mostrar mais",
                            style: GoogleFonts.poppins(color: Colors
                                .orangeAccent, fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 46),),*/
                ],

              )
          ),
        ],
      ),
    );
  }


  Widget favoritarPet(ModelUsers user,ModelPet pet) {
    String? idUsuarioatual = FirebaseAuth.instance.currentUser?.uid;
    return StarButton(
        iconSize: 60,
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