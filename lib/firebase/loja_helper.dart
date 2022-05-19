
import 'package:cloud_firestore/cloud_firestore.dart';

class Loja {
  String id;
  final String nome;
  final String imgUrl;
  final Map endereco;
  final bool status;
  final num avaliacao;
  final num taxa;
  final num pedidoMin;
  final num tempMax; // removido depois - função para calcular
  final num tempMin; // removido depois - função para calcular
  final num distancia; // removido depois - função para calcular
  final List tipoProdutos;

  Loja(
      {this.id = '',
        required this.nome,
        required this.imgUrl,
        required this.endereco,
        required this.status,
        required this.avaliacao,
        required this.taxa,
        required this.pedidoMin,
        required this.tempMax, // removido depois - função para calcular
        required this.tempMin, // removido depois - função para calcular
        required this.distancia, // removido depois - função para calcular
        required this.tipoProdutos
      });

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'imgUrl': imgUrl,
    'endereco': endereco,
    'status': status,
    'avaliacao': avaliacao,
    'taxa': taxa,
    'pedidoMin': pedidoMin,
    'tempMax': tempMax,
    'tempMin': tempMin,
    'distancia': distancia,
    'tipoProdutos': tipoProdutos
  };

  static Loja fromJson(Map<String, dynamic> json) => Loja(
      id: json['id'],
      nome: json['name'],
      imgUrl: json['imgUrl'],
      endereco: json['endereco'],
      status: json['status'],
      avaliacao: json['avaliacao'],
      taxa: json['taxa'],
      pedidoMin: json['pedidoMin'],
      tempMax: json['tempMax'],
      tempMin: json['tempMin'],
      distancia: json['distancia'],
      tipoProdutos: json['tipoProdutos']);
}

Stream<List<Loja>> readUsers() => FirebaseFirestore.instance
    .collection("lojas")
    .where("name", isNotEqualTo: "nome")
//.orderBy("status", descending: true)
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) => Loja.fromJson(doc.data())).toList());

Stream<Loja> getLojaById(String id) => FirebaseFirestore.instance
    .collection("lojas")
    .doc(id)
    .snapshots()
    .map((snapshot) => Loja.fromJson(snapshot.data()!));
    //.map((snapshot) => snapshot.docs.map((doc) => Loja.fromJson(doc.data())).toList());


Future<Loja?> readLoja(String idLoja) async{
  final docUser = FirebaseFirestore.instance.collection('lojas').doc(idLoja);
  final snapshot = await docUser.get();
  if (snapshot.exists){
    return Loja.fromJson(snapshot.data()!);
  }
}
// class Endereco {
//   final String cep;
//   final String rua;
//   final num numero;
//   final String bairro;
//   final String cidade;
//
//   Endereco(
//       {required this.cep,
//       required this.rua,
//       required this.numero,
//       required this.bairro,
//       required this.cidade});
//
//   Map<String, dynamic> toJson() => {
//         'cep': cep,
//         'rua': rua,
//         'numero': numero,
//         'bairro': bairro,
//         'cidade': cidade
//       };
// }

// Future criarLoja(Loja loja) async {
//   final docLoja = FirebaseFirestore.instance.collection('lojas').doc();
//   user.id = docLoja.id;
//
//   final json = user.toJson();
//
//   await docUser.set(json);
// }

// Future criarLoja() async {
//   final docLoja = FirebaseFirestore.instance.collection('lojas').doc();
//
//   final end = Endereco(
//     cep: '50456000',
//     rua: 'rua das carambolas',
//     numero: 123,
//     bairro: 'Kartabo',
//     cidade: 'Fortaleza'
//   );
//
//   final loja = Loja(
//       name: 'NutriPet Rações',
//       imgUrl:
//           'https://mir-s3-cdn-cf.behance.net/projects/404/597eff125205197.Y3JvcCw4MzM1LDY1MTksMCw5MDc.jpg',
//       endereco: end,
//       status: true,
//       avaliacao: 4.3,
//       taxa: 7,
//       tempMax: 70,
//       tempMin: 40,
//       distancia: 1.1);
//
//   final json = loja.toJson();
//
//   await docLoja.set(json);
// }
