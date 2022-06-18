import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {
  String id;
  final String nome;
  final String imgUrl;
  final bool estoque;
  final String tipo;
  final num valor;
  final bool promocao;
  final num novoValor;

  Produto(
      {this.id = '',
        required this.nome,
        required this.imgUrl,
        required this.estoque,
        required this.tipo,
        required this.valor,
        this.promocao = false,
        this.novoValor = 0});

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'imgUrl': imgUrl,
    'estoque': estoque,
    'tipo': tipo,
    'valor': valor,
    'promocao': promocao,
    'novoValor': novoValor
  };

  static Produto fromJson(Map<String, dynamic> json) => Produto(
      id: json['id'],
      valor: json['valor'],
      imgUrl: json['imgUrl'],
      tipo: json['tipo'],
      estoque: json['estoque'],
      nome: json['nome'],
      promocao: json['promocao'],
      novoValor: json['novoValor']
  );
}

Stream<List<Produto>> getProdByType({required String type, required String id}) =>
    FirebaseFirestore.instance
        .collection("lojas")
        .doc(id)
        .collection('produtos')
        .where("tipo", isEqualTo: type)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Produto.fromJson(doc.data())).toList());

