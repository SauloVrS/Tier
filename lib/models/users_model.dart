import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tier/models/pet_model.dart';

class ModelUsers {
  String? idUsuario;
  final String? descricaoUsuario;
  final String? fotoUsuario;
  final String? nomeUsuario;
  final List? enderecoUsuario; //mudar de string p matriz
  final int pontos;
  List petsFavoritos = [];
  List lojasFavoritas = [];

  ModelUsers(
      {this.idUsuario = '',
      required this.descricaoUsuario,
      required this.fotoUsuario,
      required this.nomeUsuario,
      required this.enderecoUsuario,
      required this.pontos,
      required this.petsFavoritos,
      required this.lojasFavoritas});

  Map<String, dynamic> toJson() => {
        'idUsuario': idUsuario,
        'descricaoUsuario': descricaoUsuario,
        'fotoUsuario': fotoUsuario,
        'nomeUsuario': nomeUsuario,
        'enderecoUsuario': enderecoUsuario,
        'pontos': pontos,
        'petsFavoritos': petsFavoritos,
        'lojasFavoritas': lojasFavoritas
      };

  static ModelUsers fromJson(Map<String, dynamic> json) => ModelUsers(
      idUsuario: json['idUsuario'],
      descricaoUsuario: json['descricaoUsuario'],
      fotoUsuario: json['fotoUsuario'],
      nomeUsuario: json['nomeUsuario'],
      enderecoUsuario: json['enderecoUsuario'],
      pontos: json['pontos'],
      petsFavoritos: json['petsFavoritos'],
      lojasFavoritas: json['lojasFavoritas']);
}

class ModelFavoritosLojas {
  final String idFav;
  final String idLoja;

  ModelFavoritosLojas({this.idFav = '', required this.idLoja});

  Map<String, dynamic> toJason() => {
        'idFav': idFav,
        'idLoja': idLoja,
      };
  static ModelFavoritosLojas fromJson(Map<String, dynamic> json) =>
      ModelFavoritosLojas(
        idFav: json['idFav'],
        idLoja: json['idLoja'],
      );
}

class ModelFavoritosAnimais {
  final String idFav;
  final String idDono;
  final String idPet;

  ModelFavoritosAnimais({
    this.idFav = '',
    required this.idDono,
    required this.idPet,
  });

  Map<String, dynamic> toJason() => {
        'idFav': idFav,
        'idDono': idDono,
        'idPet': idPet,
      };
  static ModelFavoritosAnimais fromJson(Map<String, dynamic> json) =>
      ModelFavoritosAnimais(
        idDono: json['idDono'],
        idPet: json['idPet'],
        idFav: json['idFav'],
      );
}

class ModelEnderecos {
  final String idEnd;
  final String bairro;
  final String cidade;
  final String rua;
  final int numero;
  final String cep;
  final String pontoRef;
  final String estado;

  ModelEnderecos({
    this.idEnd = '',
    required this.cidade,
    required this.bairro,
    required this.cep,
    required this.numero,
    required this.rua,
    required this.pontoRef,
    required this.estado,
  });

  Map<String, dynamic> toJason() => {
        'idEnd': idEnd,
        'rua': rua,
        'bairro': bairro,
        'cidade': cidade,
        'numero': numero,
        'cep': cep,
        'pontoRef': pontoRef,
        'estado': estado,
      };

  static ModelEnderecos fromJson(Map<String, dynamic> json) => ModelEnderecos(
        idEnd: json['idEnd'],
        numero: json['numero'],
        rua: json['rua'],
        estado: json['estado'],
        cep: json['cep'],
        pontoRef: json['pontoRef'],
        bairro: json['bairro'],
        cidade: json['cidade'],
      );
}

//ler usuario
Future<ModelUsers?> readUser(String idUser) async {
  final docUser = FirebaseFirestore.instance.collection('usuarios').doc(idUser);
  final snapshot = await docUser.get();
  if (snapshot.exists) {
    return ModelUsers.fromJson(snapshot.data()!);
  }
}

//ler lista de favoritos lojas
Stream<List<ModelFavoritosLojas>> readFavoritosLojas(String id) =>
    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .collection('favoritosLojas')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ModelFavoritosLojas.fromJson(doc.data()))
            .toList());

//ler lista de favoritos Animais
Stream<List<ModelFavoritosAnimais>> readFavoritosAnimais(String id) =>
    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .collection('favoritosPets')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ModelFavoritosAnimais.fromJson(doc.data()))
            .toList());
//ler pets do usuario
Stream<List<ModelPet>> readPetsDono(String idDono) => FirebaseFirestore.instance
    .collection('pets')
    .where("idUsuario", isEqualTo: idDono)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ModelPet.fromJson(doc.data())).toList());

//ler pet especifico
Future<ModelPet?> readPet(String? idPet) async {
  final docUser = FirebaseFirestore.instance.collection('pets').doc(idPet);
  final snapshot = await docUser.get();
  if (snapshot.exists) {
    return ModelPet.fromJson(snapshot.data()!);
  }
}

//Criar favorito
Future favoritarAnimal({
  required String idFav, //oq é isso aqui
  required String idDono,
  required String idPet,
  required String idUsuario, //usuario atual
}) async {
  final docUser = FirebaseFirestore.instance
      .collection('usuarios')
      .doc(idUsuario)
      .collection('favoritosPets')
      .doc();
  final fav = ModelFavoritosAnimais(
    idFav: docUser.id,
    idDono: idDono,
    idPet: idPet,
  );
  final json = fav.toJason();
  await docUser.set(json);
}

Stream<List<ModelPet>> readPets(isSelected, value, option, valueIdade) {
  String typePet = "Cachorro";
  if (isSelected[0] == true) {
    typePet = "Cachorro";
  } else if (isSelected[1] == true) {
    typePet = "Gato";
  } else if (isSelected[2] == true) {
    typePet = "Rato";
  } else {
    typePet = "Passaro";
  }

  String generoPet = "Macho";
  if (value == "Macho") {
    generoPet = "Macho";
  } else {
    generoPet = "Fêmea";
  }

  bool distanciaDescending = false;
  if (option == "Próximos") {
    distanciaDescending = false;
  } else {
    distanciaDescending = true;
  }

  bool idadeDescending = true;
  if (valueIdade == "Menor idade") {
    idadeDescending = false;
  } else {
    idadeDescending = true;
  }

  return FirebaseFirestore.instance
      .collection("pets")
      .where("typePet", isEqualTo: typePet)
      .where("generoPet", isEqualTo: generoPet)
      .orderBy("distanciaPet", descending: distanciaDescending)
      .orderBy("idadePet", descending: idadeDescending)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ModelPet.fromJson(doc.data())).toList());
}

Stream<List<ModelPet>> readPets2() {
  return FirebaseFirestore.instance.collection("pets").snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => ModelPet.fromJson(doc.data())).toList());
}

//ler user
Future<ModelUsers?> readUser2(String idUser) async {
  final docUser = FirebaseFirestore.instance.collection('usuarios').doc(idUser);
  final snapshot = await docUser.get();
  if (snapshot.exists) {
    return ModelUsers.fromJson(snapshot.data()!);
  }
}

class ModelFavoritosPets {
  final String idPet;

  ModelFavoritosPets({
    required this.idPet,
  });

  Map<String, dynamic> toJason() => {
        'idPet': idPet,
      };
  static ModelFavoritosPets fromJson(Map<String, dynamic> json) =>
      ModelFavoritosPets(
        idPet: json['idPet'],
      );
}

//Adicionar Endereço
Future adicionarEndereco({
  required String idUsuario,
  required String cep,
  required String rua,
  required int numero,
  required String bairro,
  required String cidade,
  required String estado,
  required String pontoRef,
}) async {
  final docUser = FirebaseFirestore.instance
      .collection('usuarios')
      .doc(idUsuario)
      .collection('enderecos')
      .doc();
  final end = ModelEnderecos(
      idEnd: docUser.id,
      cidade: cidade,
      bairro: bairro,
      cep: cep,
      numero: numero,
      rua: rua,
      pontoRef: pontoRef,
      estado: estado);
  final json = end.toJason();
  await docUser.set(json);
}

//ler endereços
Stream<List<ModelEnderecos>> readEnderecos(String id) =>
    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .collection('enderecos')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ModelEnderecos.fromJson(doc.data()))
            .toList());

//ler endereço especifico
Future<ModelEnderecos?> readEnd(String? idEnd) async {
  final docUser = FirebaseFirestore.instance.collection('pets').doc(idEnd);
  final snapshot = await docUser.get();
  if (snapshot.exists) {
    return ModelEnderecos.fromJson(snapshot.data()!);
  }
}
