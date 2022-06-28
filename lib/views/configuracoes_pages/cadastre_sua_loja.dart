import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tier/colors.dart';
import 'package:tier/firebase/adicionar_imagens.dart';


import 'package:tier/views/perfil_pages/meu_perfil.dart';

import 'dart:typed_data';
import 'dart:convert';

import 'package:tier/views/perfil_pages/perfil_usuario.dart';



class Cadastro_Loja extends StatefulWidget {
  const Cadastro_Loja({ Key? key }) : super(key: key);

  @override
  State<Cadastro_Loja> createState() => _Cadastro_LojaState();
}

class _Cadastro_LojaState extends State<Cadastro_Loja> {


  final proprietarioLojaId = FirebaseAuth.instance.currentUser?.uid;
  
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _nomeLoja;
  late num  _pedidoMinimo;
  late num  _taxaDeEntrega;

  var  _cep;
  var  _logradouro;
  late num  _numero;
  var  _complemento;
  var  _bairro;
  var _estado;
  var _cidade;
  

  CollectionReference lojasCollection = FirebaseFirestore.instance.collection('lojas');

  
 

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Nome da Loja'),
      maxLength: 25,
      validator: ( value) {
        if (value!.isEmpty) {
          return 'O campo nome está vazio';
        }

        return null;
      },
      onSaved: ( value) {
        _nomeLoja = value!;
      },
    );
  }
  Widget _buildCep() {
    return TextFormField(
      
      decoration: const InputDecoration(labelText: 'Cep'),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      maxLength: 8,
      validator: ( value) {
        if (value!.isEmpty) {
          return 'O campo CEP está vazio';//
        }

        return null;
      },
      onSaved: ( value) {
        _cep = value!;
      },
    );
  }
  Widget _buildLogradouro() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Logradouro'),
      maxLength: 35,
      validator: ( value) {
        if (value!.isEmpty) {
          return 'O campo CEP está vazio';
        }

        return null;
      },
      onSaved: ( value) {
        _logradouro = value!;
      },
    );
  }
  Widget _buildNumero() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Número'),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      maxLength: 5,
      validator: ( value) {
        if (value!.isEmpty) {
          return 'O campo CEP está vazio';
        }

        return null;
      },
      onSaved: ( value) {
        _numero = num.parse(value!);
      },
    );
  }
  Widget _buildComplemento() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Complemento'),
      maxLength:   10,
      onSaved: ( value) {
        _complemento = value!;
      },
    );
  }

  Widget _buildTaxa() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Taxa de Entrega'),
      maxLength: 5,
       keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: ( value) {
        if (value!.isEmpty) {
          return 'O campo Taxa de entrega está vazio';
        }

        return null;
      },
      onSaved: (value) {
        _taxaDeEntrega =  num.parse(value!); //value as num;
      },
    );
  }
  Widget _buildPedidoMinimo() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Pedido Mínimo'),
      maxLength: 4,
       keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: ( value) {
        if (value!.isEmpty) {
          return 'O campo pedido mínimo de entrega está vazio';
        }

        return null;
      },
      onSaved: ( value) {

        _pedidoMinimo = num.parse(value!);
        //_pedidoMinimo = value! as num;
      },
    );
  }

   adicionarImagem(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return SimpleDialog(
        title: const Text('Adicione sua Logo'),
        children: [
          
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
  

  Future<void>  adicionarId(String id) async {
    lojasCollection.doc(id).update({
      'id':id,
    });
  }

  Future<void> cadastrarLoja() async {
    try{

        String imgUrl = await StorageMethods().uploadImageToStorage('logolojas/', _file!, true);
     
        lojasCollection.add({
          'proprietarioId':proprietarioLojaId,
          'nome':_nomeLoja,
          'imgUrl':imgUrl,
          'endereco':{
            'cep':_cep,
            'logradouro':_logradouro,
            'numero':_numero,
            'cidade':_cidade,
            'estado':_estado,
            'complemento':_complemento
            },
          'taxa':_taxaDeEntrega,
          'pedidoMin':_pedidoMinimo,
          'status':true,
          'tempMin':40,
          'tempMax':50,
          'avaliacao':4.9,
          'tipoProdutos':{},
          'distancia':3.5
        }).then((value) async {
          await adicionarId(value.id);
          showSnackBar('Loja Cadastrada!', context);

        });
    }catch(err){
         showSnackBar('Ocorreu um erro. Tente novamente.', context);
         
    }
  }


  Uint8List? _file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(0.9),
      body:SingleChildScrollView(
        child: Column(
          children:[
            GestureDetector(
              onTap:(){
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
                                        TelaPerfilUsuario(),
                                  )
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 20,
                              semanticLabel: "Adicione sua Logo.",
                            ),
                            
                          ),
                      ],
                    ),
                    Container(
                        height: 75,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_outlined,
                            size: 30,
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                  ],
                ),
              )
            ),
            Container(
              width:MediaQuery
                    .of(context)
                    .size
                    .width,
              decoration: BoxDecoration(
                    color: AppColor.background,
                    
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                              top:10,bottom: 10),
                        padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                          ),
                        
                        child: _buildName(),
                      ),
                       Container(
                        margin: const EdgeInsets.only(
                              top:10,bottom: 10),
                        padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                          ),
                        
                        child: _buildCep(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                              top:10,bottom: 10),
                        padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                          ),
                        
                        child: _buildLogradouro(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                              top:10,bottom: 10),
                        padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                          ),
                        
                        child: _buildNumero(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                              top:10,bottom: 10),
                        padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                          ),
                        
                        child: _buildComplemento(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                              top:10,bottom: 10),
                        padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                          ),
                        
                        child: _buildPedidoMinimo(),
                      ),
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
                              value: _estado,
                              hint: Text('Estado'),
                              isExpanded: true,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              style: GoogleFonts.poppins(
                                color: AppColor.textosPretos2,
                              ),
                              items: <String>[
                                'Ceará',
                                'São Paulo',
                                'Distrito Federal',
                                'Goiás',
                              ]
                                  .map<DropdownMenuItem<String>>((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _estado = newValue!;
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
                              value: _cidade,
                              isExpanded: true,
                              hint: Text('Cidade'),
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              style: GoogleFonts.poppins(
                                color: AppColor.textosPretos2,
                              ),
                              items: <String>['Fortaleza', 'São Paulo','Brasília','Goiania']
                                  .map<DropdownMenuItem<String>>((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: ( newValue) {
                                setState(() {
                                  _cidade = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                       Container(
                        margin: const EdgeInsets.only(
                              top:10,bottom: 10),
                        padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.cinzaBranco),
                          ),
                        
                        child: _buildTaxa(),
                      ),
                      GestureDetector(
                        onTap:(){
                          if (!_formKey.currentState!.validate()) {
                             return;
                          }

                          _formKey.currentState!.save();
                          cadastrarLoja();

                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                          width: MediaQuery
                                        .of(context)
                                        .size
                                        .width - 80,
                          height: 50,
                          decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.amareloPrincipal,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cadastrar',
                                style:GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.textoBranco,
                                ),
                              ),
                            ],
                            )

                        ),
                      )
                    ]
                  ),

                )
               ),
            ),
          
           
          ]
        ),
      ),
    );
  }
}

