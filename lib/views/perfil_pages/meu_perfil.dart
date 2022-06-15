import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';

import 'package:tier/widgets/perfil_pages/editar_meu_perfil.dart';
import 'package:tier/widgets/perfil_pages/meus_animais_list.dart';
import '../../colors.dart';
import '../../models/pet_model.dart';
import '../../models/users_model.dart';
import '../pet_pages/pet_page.dart';
import 'adicionar_pet.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/perfil_pages/adicionar_pet.dart';

class MeuPerfil extends StatefulWidget {
  MeuPerfil({ Key? key}) : super(key: key);
  @override
  _MeuPerfilState createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(0.95),
      body: SafeArea(
        child: FutureBuilder<ModelUsers?>(
          future: readUser(idUsuario!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final user = snapshot.data;
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 100) / 2,
                          height: 110,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TelaPerfilUsuario(),
                                          ));
                                    },
                                    icon: Icon(Icons.arrow_back_ios_outlined),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(1, 1),
                                    color: AppColor.cinzaClaro.withOpacity(0.6),
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(-1, -1),
                                    color: AppColor.cinzaClaro.withOpacity(0.6),
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(-1, 1),
                                    color: AppColor.cinzaClaro.withOpacity(0.6),
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(1, -1),
                                    color: AppColor.cinzaClaro.withOpacity(0.6),
                                  ),
                                ],
                              ),
                              width: 100,
                              height: 100,
                              child: (user!.fotoUsuario == null)
                                  ? CircleAvatar(
                                      backgroundColor: AppColor.background,
                                      foregroundColor: AppColor.textosPretos2,
                                      child: Icon(Icons.perm_identity),
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(user.fotoUsuario!),
                                    ),
                            ),
                          ],
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 100) / 2,
                          height: 110,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Container()),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditarPerfil(),
                                          ));
                                    },
                                    icon: Icon(Icons.mode_edit_outlined),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    user.nomeUsuario!,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textosPretos2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        color: AppColor.background,
                      ),
                      child: ListView(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              height: 80,
                              child: Text(
                                user.descricaoUsuario!,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdicionarPet(),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              width: MediaQuery.of(context).size.width - 80,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.amareloPrincipal,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Adicionar novo Animal',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.textoBranco,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            width: MediaQuery.of(context).size.width - 50,
                            child: Text(
                              'Animais para adoção',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textosPretos2,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          StreamBuilder<List<ModelPet>>(
                            stream: readPetsUser(idUsuario!),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text(
                                    'Something went wrong! ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                final pets = snapshot.data;
                                if (pets!.isEmpty) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 200,
                                            width: 200,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/img_meus_animais.png"))),
                                          ),
                                          Text(
                                            'Não há animais para adoção',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return SizedBox(
                                    //height: 100,
                                    child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: (pets.length % 2 == 0)
                                            ? (pets.length) ~/ 2
                                            : (pets.length) ~/ 2 + 1,
                                        itemBuilder: (context, index) {
                                          int a = 2 * index;
                                          int b = a + 1;
                                          return Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PetPage(
                                                                pet: pets[a],
                                                                idUsuario: idUsuario!),
                                                      ));
                                                },
                                                child: MeusAnimaisList(
                                                    nome: pets[a].nomePet,
                                                    imgUrl: pets[a].fotoPet,
                                                    idade: pets[a].idadePet,
                                                    direita: 10,
                                                    esquerda: 15,
                                                    idUser: idUsuario),
                                              ),
                                              (b <= pets.length - 1)
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PetPage(
                                                                      pet: pets[b],
                                                                      idUsuario: idUsuario!),
                                                            ));
                                                      },
                                                      child: MeusAnimaisList(
                                                          nome: pets[b].nomePet,
                                                          imgUrl:
                                                              pets[b].fotoPet,
                                                          idade:
                                                              pets[b].idadePet,
                                                          direita: 10,
                                                          esquerda: 15,
                                                          idUser: idUsuario),
                                                    )
                                                  : Container(),
                                            ],
                                          );
                                        }),
                                  );
                                }
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
