import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/models/users_model.dart';

import '../../colors.dart';

class AdicionarEndereco extends StatefulWidget {
  const AdicionarEndereco({Key? key}) : super(key: key);

  @override
  _AdicionarEnderecoState createState() => _AdicionarEnderecoState();
}

class _AdicionarEnderecoState extends State<AdicionarEndereco> {

  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;
  TextEditingController ruaController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController pontoRefController = TextEditingController();
  TextEditingController estadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(right: 15, left: 15, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.cinzaClaro,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: ruaController,
                      decoration: InputDecoration(
                        labelText: 'Rua',
                        focusedBorder: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        labelStyle: TextStyle(
                          color: AppColor.textosPretos2,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        labelText: 'Nº',
                        focusedBorder: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        labelStyle: TextStyle(
                          color: AppColor.textosPretos2,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: bairroController,
                decoration: InputDecoration(
                  labelText: 'Bairro',
                  focusedBorder: const UnderlineInputBorder(),
                  enabledBorder: const UnderlineInputBorder(),
                  labelStyle: TextStyle(
                    color: AppColor.textosPretos2,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: cidadeController,
                      decoration: InputDecoration(
                        labelText: 'Cidade',
                        focusedBorder: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        labelStyle: TextStyle(
                          color: AppColor.textosPretos2,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      controller: estadoController,
                      decoration: InputDecoration(
                        labelText: 'Estado',
                        focusedBorder: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        labelStyle: TextStyle(
                          color: AppColor.textosPretos2,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: cepController,
                decoration: InputDecoration(
                  labelText: 'CEP',
                  focusedBorder: const UnderlineInputBorder(),
                  enabledBorder: const UnderlineInputBorder(),
                  labelStyle: TextStyle(
                    color: AppColor.textosPretos2,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: pontoRefController,
                decoration: InputDecoration(
                  labelText: 'Ponto de referência',
                  focusedBorder: const UnderlineInputBorder(),
                  enabledBorder: const UnderlineInputBorder(),
                  labelStyle: TextStyle(
                    color: AppColor.textosPretos2,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  adicionarEndereco(
                      idUsuario: idUsuario!,
                      cep: cepController.text,
                      rua: ruaController.text,
                      numero: int.parse(numberController.text),
                      bairro: bairroController.text,
                      cidade: cidadeController.text,
                      estado: estadoController.text,
                      pontoRef: pontoRefController.text);
                  Navigator.of(context).pop();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                      width: MediaQuery.of(context).size.width-30,
                      color: AppColor.textosPretos2,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Adicionar endereço',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );;
  }
}
