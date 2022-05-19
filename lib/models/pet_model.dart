import 'package:cloud_firestore/cloud_firestore.dart';

class ModelPet {
  String id;
  final String? descricaoPet;
  final String? distancia;
  final String? fotoPet;
  final String? generoPet;
  final String? idadePet;
  final String? nomePet;
  final String? typePet;

  ModelPet({
    this.id = '',
    required this.descricaoPet,
    required this.distancia,
    required this.fotoPet,
    required this.generoPet,
    required this.idadePet,
    required this.nomePet,
    required this.typePet,

  });

  Map<String, dynamic> toJson() => {
    'descricaoPet' : descricaoPet,
    'distancia' : distancia,
    'fotoPet' : fotoPet,
    'generoPet' : generoPet,
    'idadePet' : idadePet,
    'nomePet' : nomePet,
    'typePet' : typePet,

  };

  static ModelPet fromJson(Map<String, dynamic> json) => ModelPet(
      descricaoPet: json['descricaoPet'],
      distancia: json['distancia'],
      fotoPet: json['fotoPet'],
      generoPet: json['generoPet'],
      idadePet:  json['idadePet'],
      nomePet: json['nomePet'],
      typePet: json['typePet']
  );
}
Stream<List<ModelPet>> readPets() => FirebaseFirestore.instance
    .collection('usuarios').doc().collection('pets')
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) => ModelPet.fromJson(doc.data())).toList());

Stream<List<ModelPet>> readPetsUser(String idUsuario) => FirebaseFirestore.instance
    .collection('usuarios').doc(idUsuario).collection('pets')
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) => ModelPet.fromJson(doc.data())).toList());

