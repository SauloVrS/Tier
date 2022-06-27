import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tier/views/perfil_pages/meu_perfil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tier/widgets/perfil_pages/modal_excluir_editar_pet.dart';

import '../../colors.dart';
import '../../firebase/adicionar_imagens.dart';
import '../../models/pet_model.dart';
import '../../models/users_model.dart';
import 'meus_animais_list.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;
  Uint8List? _file;
  TextEditingController controllername = TextEditingController();
  TextEditingController controllerdescricao = TextEditingController();
  bool removeuFoto = false;

  adicionarImagem(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
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
                    removeuFoto = false;
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
                    removeuFoto = false;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Remover Foto'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    _file = null;
                    removeuFoto = true;
                  });
                },
              )
            ],
          );
        });
  }
  void salvarFoto () async{
    try {
      String res = await FireStoreMethods().adicionarFotoPerfil(_file!, idUsuario!);
      if (res == 'success') {
        showSnackBar('Foto Adicionada!', context);
      } else {
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                                            builder: (context) => MeuPerfil(),
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
                              child: ((removeuFoto == true) ||user!.fotoUsuario == null &&
                                      _file == null)
                                  ? GestureDetector(
                                      onTap: () {
                                        adicionarImagem(context);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: AppColor.background.withOpacity(0.8),
                                        foregroundColor: AppColor.textosPretos2,
                                        child: Icon(Icons.add),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        adicionarImagem(context);
                                      },
                                      child: Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(90),
                                          image: _file == null
                                              ? DecorationImage(
                                            image:NetworkImage(user.fotoUsuario!),
                                            fit: BoxFit.cover,
                                          )
                                              : DecorationImage(image: MemoryImage(_file!), fit: BoxFit.cover,),
                                        ),
                                        child: Icon(Icons.add),
                                      ),
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
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.cinzaBranco,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            controller: controllername,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user!.nomeUsuario,
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textosPretos2,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          child: Icon(Icons.edit),
                        ),
                      ],
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColor.cinzaBranco.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: controllerdescricao,
                              textAlign: TextAlign.center,
                              maxLength: 100,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user.descricaoUsuario,
                                hintMaxLines: 3,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (controllername.text != '' || controllerdescricao.text != ''){
                                final docUser = FirebaseFirestore.instance.collection('usuarios').doc(idUsuario);
                                if (controllername.text != ''){
                                  docUser.update({
                                    'nomeUsuario' : controllername.text,
                                  });
                                }
                                if (controllerdescricao.text != ''){
                                  docUser.update({
                                    'descricaoUsuario' : controllerdescricao.text,
                                  });
                                }
                                showSnackBar('Dados atualizados com sucesso', context);
                              }
                              if (_file != null){
                                removeuFoto = false;
                                salvarFoto();
                              }else if (removeuFoto == true){
                                final docUser = FirebaseFirestore.instance.collection('usuarios').doc(idUsuario);
                                  docUser.update({
                                    'fotoUsuario' : null,
                                  });
                              }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MeuPerfil(),
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
                          Expanded(
                            child: StreamBuilder<List<ModelPet>>(
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
                                                      image: AssetImage("images/img_meus_animais.png"))),
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
                                    return ListView.builder(
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
                                                onTap:() async{
                                                  return showMaterialModalBottomSheet(
                                                      expand: false,
                                                      backgroundColor: Colors.transparent,
                                                      context: context,
                                                      builder: (context) =>  ModalEditPet(idPet: pets[a].idPet,)
                                                  );
                                                },
                                                child: MeusAnimaisList(
                                                    nome: pets[a].nomePet,
                                                    imgUrl: pets[a].fotoPet,
                                                    idade: pets[a].idadePet,
                                                    direita: 10,
                                                    esquerda: 15,
                                                    idUser: idUsuario),
                                              ),
                                              (b <= pets.length - 1) ?
                                              GestureDetector(
                                                onTap: ()async{
                                                  return showMaterialModalBottomSheet(
                                                      expand: false,
                                                      backgroundColor: Colors.transparent,
                                                      context: context,
                                                      builder: (context) =>  ModalEditPet(idPet: pets[b].idPet,)
                                                  );
                                                },
                                                child: MeusAnimaisList(
                                                        nome: pets[b].nomePet,
                                                        imgUrl: pets[b].fotoPet,
                                                        idade: pets[b].idadePet,
                                                        direita: 10,
                                                        esquerda: 15,
                                                        idUser: idUsuario),
                                              )
                                                  : Container(),
                                            ],
                                          );
                                        });
                                  }
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
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
