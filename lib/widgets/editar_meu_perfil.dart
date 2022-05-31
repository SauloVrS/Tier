import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tier/views/perfil_pages/meu_perfil.dart';

import '../colors.dart';
import '../firebase/adicionar_imagens.dart';
import '../models/pet_model.dart';
import '../models/users_model.dart';
import 'meus_animais_list.dart';
class EditarPerfil extends StatefulWidget {
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  String idUsuario = 'yE7Al0eRAnc59JdjfrNh';
  Uint8List? _file;

  adicionarImagem(BuildContext context){
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: const Text('Escolha uma opcão'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Tirar uma foto'),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Escolher uma foto'),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery);
              setState(() {
                _file = file;
              });
            },
          )

        ],
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(0.95),
      body: SafeArea(
        child: FutureBuilder<ModelUsers?>(
          future: readUser(idUsuario),
          builder: (context, snapshot) {
            if (snapshot.hasError){
              print (snapshot.error);
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData){
              final user = snapshot.data;
              return Column(
                children: [
                  const SizedBox(height: 10,),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 100)/2,
                          height: 110,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                            builder: (context) => MeuPerfil(idUsuario: idUsuario),
                                          )
                                      );
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
                              child: (user!.fotoUsuario == null && _file == null)?
                              GestureDetector(
                                onTap: (){
                                  adicionarImagem(context);
                                },
                                child: CircleAvatar(
                                  backgroundColor: AppColor.background,
                                  foregroundColor: AppColor.textosPretos2,
                                  child: Icon(Icons.perm_identity),
                                ),
                              ):
                              GestureDetector(
                                onTap: (){
                                  adicionarImagem(context);
                                },
                                child: CircleAvatar(
                                  backgroundImage: _file == null ? NetworkImage(user.fotoUsuario!): null,
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 100)/2,
                          height: 110,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Container()),
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
                  const SizedBox(height: 10,),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                        color: AppColor.background,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                            height: 80,
                            child: Text(
                              user.descricaoUsuario!,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){},
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
                                    'Salvar Alterações',
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
                          const SizedBox(height: 10,),
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
                          const SizedBox(height: 10,),
                          Expanded(
                            child: StreamBuilder<List<ModelPet>>(
                              stream: readPetsUser(idUsuario),
                              builder: (context, snapshot){
                                if (snapshot.hasError){
                                  return Text('Something went wrong! ${snapshot.error}');
                                }
                                else if (snapshot.hasData){
                                  final pets = snapshot.data;
                                  if (pets!.isEmpty) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 200,
                                              width: 200,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/img_meus_animais.png"
                                                      )
                                                  )
                                              ),
                                            ),
                                            Text(
                                              'Não há animais para adoção',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 15,),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else {
                                    return ListView.builder(
                                        itemCount: (pets.length%2 == 0)? (pets.length)~/2: (pets.length)~/2 + 1,
                                        itemBuilder: (context, index) {
                                          int a = 2 * index;
                                          int b = a + 1;
                                          return Row(
                                            children: [
                                              MeusAnimaisList(
                                                  nome: pets[a].nomePet,
                                                  imgUrl: pets[a].fotoPet,
                                                  idade: pets[a].idadePet,
                                                  direita: 10,
                                                  esquerda: 15,
                                                  idUser: idUsuario),
                                              (b <= pets.length - 1)?
                                              MeusAnimaisList(
                                                  nome: pets[b].nomePet,
                                                  imgUrl: pets[b].fotoPet,
                                                  idade: pets[b].idadePet,
                                                  direita: 10,
                                                  esquerda: 15,
                                                  idUser: idUsuario):
                                              Container(),
                                            ],
                                          );
                                        }
                                    );
                                  }
                                }
                                else{
                                  return Center(child: CircularProgressIndicator(),);
                                }
                              },
                            )
                            ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
