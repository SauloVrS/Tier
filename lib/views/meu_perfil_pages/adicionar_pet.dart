import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/models/users_model.dart';

import '../../colors.dart';
import '../meu_perfil.dart';
import '../perfil_usuario.dart';


class AdicionarPet extends StatefulWidget {
  AdicionarPet({required this.idUsuario, Key? key}) : super(key: key);
  String idUsuario;
  @override
  _AdicionarPetState createState() => _AdicionarPetState(idUsuario: idUsuario);
}

class _AdicionarPetState extends State<AdicionarPet> {
  _AdicionarPetState({required this.idUsuario,});
  String idUsuario;
  String tipo = 'Tipo';
  String genero = 'Gênero';
  String porte = 'Porte';
  final controllerIdade = TextEditingController();
  final controllerName = TextEditingController();
  final controllerDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(0.9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (context) => TelaPerfilUsuario(),
                      )
                  );
                },
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                    builder: (context) => MeuPerfil(idUsuario: idUsuario,),
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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.background,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.cinzaBranco),
                        ),
                        child: TextField(
                          controller: controllerName,
                          decoration: InputDecoration(
                            hintText: 'Adicionar nome',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width-60)/2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.cinzaBranco),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton(
                              itemHeight: 50,
                              underline: Container(),
                              value: tipo,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down_outlined),
                              style: GoogleFonts.poppins(
                                color: AppColor.textosPretos2,
                              ),
                              items: <String>['Tipo', 'Gatos', 'Cachorros', 'Passaros', 'Roedores']
                                  .map<DropdownMenuItem<String>>((String value) {
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
                            width: (MediaQuery.of(context).size.width-60)/2,
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
                              icon: const Icon(Icons.keyboard_arrow_down_outlined),
                              style: GoogleFonts.poppins(
                                color: AppColor.textosPretos2,
                              ),
                              items: <String>['Gênero', 'Macho', 'Fêmea']
                                  .map<DropdownMenuItem<String>>((String value) {
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
                      Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width-60)/2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.cinzaBranco),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller: controllerIdade,
                              decoration: InputDecoration(
                                hintText: 'Idade',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Container(
                            width: (MediaQuery.of(context).size.width-60)/2,
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
                              icon: const Icon(Icons.keyboard_arrow_down_outlined),
                              style: GoogleFonts.poppins(
                                color: AppColor.textosPretos2,
                              ),
                              items: <String>['Porte', 'Pequeno', 'Medio', 'Grande']
                                  .map<DropdownMenuItem<String>>((String value) {
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
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.cinzaBranco),
                        ),
                        child: TextField(
                          controller: controllerDescricao,
                          maxLines: 3,
                          maxLength: 100,
                          decoration: InputDecoration(
                            hintText: 'Adicionar descrição',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width - 40,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                            //color: AppColor.cinzaBranco,
                          ),
                          child: FutureBuilder<ModelUsers?>(
                           future: readUser(idUsuario),
                           builder: (context, snapshot) {
                             if (snapshot.hasError){
                               return Text('Something went wrong! ${snapshot.error}');
                             }else if(snapshot.hasData){
                               final user = snapshot.data;
                               return Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Column(
                                     children: [
                                       Container(
                                         width: MediaQuery.of(context).size.width - 75,
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
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
                                       Container(
                                         width: MediaQuery.of(context).size.width - 75,
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           children: [
                                             Text(
                                               'Av. Treze de Maio, 1333',
                                               style: GoogleFonts.poppins(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w600,
                                                 color: AppColor.textosPretos1,
                                               ),
                                             ),
                                             Expanded(child: Container()),
                                           ],
                                         ),
                                       ),
                                       Container(
                                         width: MediaQuery.of(context).size.width - 75,
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
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
                             }else{
                               return Center(child: CircularProgressIndicator(),);
                             }
                           },
                          )
                        ),
                      ),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          //checar campos e adicionar no firebase
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
