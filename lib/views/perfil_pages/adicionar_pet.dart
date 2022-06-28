import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tier/models/users_model.dart';
import '../../colors.dart';
import '../../firebase/adicionar_imagens.dart';

import '../pet_pages/age/age_calculator.dart';
import '../pet_pages/age/date_field_picker.dart';
import '../pet_pages/age/helper_age.dart';
import '../pet_pages/age/utils_age.dart';
import 'meu_perfil.dart';
import 'package:tier/views/perfil_pages/meu_perfil.dart';
import 'package:tier/colors.dart';


class AdicionarPet extends StatefulWidget {
  const AdicionarPet({Key? key}) : super(key: key);

  @override
  _AdicionarPetState createState() => _AdicionarPetState();
}

class _AdicionarPetState extends State<AdicionarPet> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;
  String? tipo;
  String? genero;
  String? porte;
  String? idade;
  final controllerName = TextEditingController();
  final controllerDescricao = TextEditingController();
  bool nomePreenchido = false;
  bool idadePreenchido = false;
  bool descricaoPreenchido = false;
  Uint8List? _file;
  bool _isLoading = false;


  //DateTime idadeconvert =  AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).months.toString() as DateTime;
  //String? idade = idadeconvert as String;
  //DateTime idade =  AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).months.toString() as DateTime;



  Future<void> _selectDate(BuildContext context, DateTime initialDate
      ,String from) async {
    if (from == 'BirthDate') {
      final DateTime? pickedBirthDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );
      if (pickedBirthDate != null && pickedBirthDate != selectedBithDate)
        setState(() {
          selectedBithDate = pickedBirthDate;
        });

      if(from == "CurrentDate"){
        final DateTime? pickedCurrentDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2101),
        );

        if (pickedCurrentDate != null && pickedCurrentDate != selectedCurrentDate)
          setState(() {
            selectedCurrentDate = pickedCurrentDate;
          });
      }


    }
  }

  void salvarAnimal(String uid,
      String distancia) async {
    try {
      setState(() {
        _isLoading = true;
      });
      String res = await FireStoreMethods().adicionarPet(
        _file!,
        uid,
        controllerDescricao.text,
        distancia,
        genero!,
        idade!,
        controllerName.text,
        tipo!,
        porte!,
      );
      setState(() {
        _isLoading = false;
      });
      if (res == 'success') {
        showSnackBar('Animal adicionado!', context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MeuPerfil(),
            ));
      } else {
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  adicionarImagem(BuildContext context) {
    return showDialog(context: context, builder: (context) {
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

  String? erroSelecao(String? tipo, String? genero, String? porte) {
    if (tipo == null || genero == null || porte == null) {
      return 'Preencha todos os campos';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controllerName.dispose();
    controllerDescricao.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(0.9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  adicionarImagem(context);
                },
                child: Container(
                  height: 250,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    image: _file == null ? null : DecorationImage(
                      image: MemoryImage(_file!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MeuPerfil(),
                                  )
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 75,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_outlined,
                            size: 30,
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: AppColor.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.cinzaBranco),
                        ),
                        child: TextField(
                          controller: controllerName,
                          maxLength: 16,
                          decoration: InputDecoration(
                            hintText: 'Adicionar nome',
                            border: InputBorder.none,
                            errorText: nomePreenchido
                                ? 'Preencha todos os campos'
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                            width: (MediaQuery
                                .of(context)
                                .size
                                .width - 60) / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.cinzaBranco),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton(
                              itemHeight: 50,
                              underline: Container(),
                              value: tipo,
                              hint: Text('Tipo'),
                              isExpanded: true,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              style: GoogleFonts.poppins(
                                color: AppColor.textosPretos2,
                              ),
                              items: <String>[
                                'Gato',
                                'Cachorro',
                                'Passaro',
                                'Rato'
                              ]
                                  .map<DropdownMenuItem<String>>((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  tipo = newValue!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Container(
                            width: (MediaQuery
                                .of(context)
                                .size
                                .width - 60) / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.cinzaBranco),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton(
                              itemHeight: 50,
                              underline: Container(),
                              value: genero,
                              isExpanded: true,
                              hint: Text('Gênero'),
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              style: GoogleFonts.poppins(
                                color: AppColor.textosPretos2,
                              ),
                              items: <String>['Macho', 'Fêmea']
                                  .map<DropdownMenuItem<String>>((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  genero = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.cinzaBranco),
                        ),
                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10, top: 10),
                        child: DatePickerField(
                          level: 'Adicionar data de nascimento',
                          onTap: () =>
                              _selectDate(
                                  context, selectedBithDate, "BirthDate"),
                          hintText: "${getFormatedDate(selectedBithDate)}",

                        ),
                      ),
                      const SizedBox(height:1,),
                      Visibility(
                        visible: false,
                        child: Container(
                          width: 0.1,
                          height: 0.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                          ),
                          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10, top: 10),
                          child:
                          DatePickerField(
                            level: 'Adicionar data de hoje',
                            onTap: ()=> _selectDate(context, selectedCurrentDate, "CurrentDate"),
                            hintText: "${getFormatedDate(selectedCurrentDate)}",
                          ),
                        ),
                      ),
                      /*IconButton(onPressed:() {

                      idade = AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).months.toString();
                      print(idade);
                      }, icon: Icon(Icons.chat, size: 1, )),*/

                      const SizedBox(height: 15,),
                      Container(
                        width: (MediaQuery
                            .of(context)
                            .size
                            .width - 60) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.cinzaBranco),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton(
                          itemHeight: 50,
                          underline: Container(),
                          value: porte,
                          isExpanded: true,
                          hint: Text('Porte'),
                          icon: const Icon(
                              Icons.keyboard_arrow_down_outlined),
                          style: GoogleFonts.poppins(
                            color: AppColor.textosPretos2,
                          ),
                          items: <String>['Pequeno', 'Medio', 'Grande']
                              .map<DropdownMenuItem<String>>((
                              String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              porte = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.cinzaBranco),
                        ),
                        child: TextField(
                          controller: controllerDescricao,
                          maxLines: 3,
                          maxLength: 120,
                          decoration: InputDecoration(
                            hintText: 'Adicionar descrição',
                            border: InputBorder.none,
                            errorText: descricaoPreenchido
                                ? 'Preencha todos os campos'
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 150,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 40,
                            padding: EdgeInsets.symmetric(vertical: 10,
                                horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.cinzaBranco),
                            ),
                            child: FutureBuilder<ModelUsers?>(
                              future: readUser(idUsuario!),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong! ${snapshot
                                      .error}');
                                } else if (snapshot.hasData) {
                                  final user = snapshot.data;
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width - 75,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  'Endereço',
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.cinzaMedio,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                                Icon(
                                                  Icons.edit_outlined,
                                                  color: AppColor.textosPretos1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 50,),
                                          SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width - 75,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  'Av. Treze de Maio, 1333',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor
                                                        .textosPretos1,
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width - 75,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  'Fortaleza - Ceará',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),);
                                }
                              },
                            )
                        ),
                      ),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: () {
                          if (erroSelecao(tipo, genero, porte) != null
                              || controllerName.text.isEmpty
                              || controllerDescricao.text.isEmpty
                              // || controllerIdade.text.isEmpty
                              || _file == null) {
                            setState(() {
                              controllerName.text.isEmpty ?
                              nomePreenchido = true : nomePreenchido = false;
                              controllerDescricao.text.isEmpty ?
                              descricaoPreenchido = true : descricaoPreenchido =
                              false;
                              //  controllerIdade.text.isEmpty ?
                              // idadePreenchido = true : idadePreenchido = false;
                            });
                            if (erroSelecao(tipo, genero, porte) != null ||
                                _file == null) {
                              final snackBar =  SnackBar(
                                  content: Text('Preencha todos os campos'));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar);
                            }
                          } else {
                            idade = AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).months.toString();
                            print(idade);
                            salvarAnimal(idUsuario!, '1,2 km' );
                          }
                          //checar campos e adicionar no firebase
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 80,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.amareloPrincipal,
                          ),
                          child: _isLoading
                              ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.textoBranco,
                              ),
                              )
                              : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      'Salvar alterações',
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

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}