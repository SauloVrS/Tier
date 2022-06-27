import 'package:cloud_firestore/cloud_firestore.dart';

class ModelPet {
  String idPet;
  String idUsuario;
  final String descricaoPet;
  final String distanciaPet;
  final String fotoPet;
  final String generoPet;
  final String idadePet;
  final String nomePet;
  final String typePet;
  final String portePet;

  ModelPet({
    this.idPet = '',
    this.idUsuario = '',
    required this.descricaoPet,
    required this.distanciaPet,
    required this.fotoPet,
    required this.generoPet,
    required this.idadePet,
    required this.nomePet,
    required this.typePet,
    required this.portePet,
  });

  Map<String, dynamic> toJson() => {
        'idPet': idPet,
        'idUsuario': idUsuario,
        'descricaoPet': descricaoPet,
        'distanciaPet': distanciaPet,
        'fotoPet': fotoPet,
        'generoPet': generoPet,
        'idadePet': idadePet,
        'nomePet': nomePet,
        'typePet': typePet,
        'portePet': portePet,
      };

  static ModelPet fromJson(Map<String, dynamic> json) => ModelPet(
      idPet: json['idPet'] ?? "",
      idUsuario: json['idUsuario'] ?? "",
      descricaoPet: json['descricaoPet'] ?? "",
      distanciaPet: json['distanciaPet'] ?? "",
      fotoPet: json['fotoPet'] ?? "",
      generoPet: json['generoPet'] ?? "",
      idadePet: json['idadePet'] ?? "",
      nomePet: json['nomePet'] ?? "",
      typePet: json['typePet'] ?? "",
      portePet: json['portePet'] ?? "");
}
/*
Stream<List<String>> getIds2() => FirebaseFirestore.instance
    .collection("usuarios")
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => ModelUsers.fromJson(doc.data()).idUser)
        .toList());*/

Stream<List<ModelPet>> getPets({required String idUser}) =>
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(idUser)
        .collection('produtos')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => ModelPet.fromJson(doc.data())).toList());
/*
Stream<List<ModelPet>> readPets() => FirebaseFirestore.instance
    .collection("usuarios")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ModelPet.fromJson(doc.data())).toList());*/

Stream<List<ModelPet>> readPetsUser(String idUsuario) =>
    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(idUsuario)
        .collection('pets')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => ModelPet.fromJson(doc.data())).toList());



