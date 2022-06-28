import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tier/firebase/produto_helper.dart';

import '../../firebase/loja_helper.dart';

class ShopProd {
  String idLoja;
  String idProduto;
  int quantidade;
  num valor;

  ShopProd({required this.idProduto, required this.idLoja, required this.quantidade, required this.valor});

  Map<String, dynamic> toJson() => {
    'idLoja': idLoja,
    'idProduto': idProduto,
    'quantidade': quantidade,
    'valor': valor
  };
}

void creatUser(String user, List carrinho) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/$user");
  await ref.set({
    "Carrinho": carrinho
  });
}

void update(String user, List carrinho) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/$user");

  await ref.set({
    "Carrinho": carrinho,
  });
}

void addCarrinho(String user, Map produto) async {
  List carrinho = [];

  final ref = FirebaseDatabase.instance.ref();

  final snapshotUser = await ref.child('users/$user').get();
  if (snapshotUser.exists) {
    final snapshot = await ref.child('users/$user/Carrinho').get();
    if (snapshot.exists) {
      snapshot.children.forEach((e) => carrinho.add(e.value));
      carrinho.add(produto);
      update(user, carrinho);
    } else {
      carrinho.add(produto);
      update(user, carrinho);
    }
  } else {
    carrinho.add(produto);
    creatUser(user, carrinho);
  }

}

void apagarProduto(String user, int index) async {
  //String user = 'Bia';
  List carrinho = [];
  //int index = 2;
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/$user/Carrinho').get();
  if (snapshot.exists) {
    snapshot.children.forEach((e) => carrinho.add(e.value));
    try{
      carrinho.removeAt(index);
      update(user, carrinho);
    } catch (e) {
      print('Something goes wrong: $e');
    }
  } else {
    print('Sem produtos no carrinho');
  }
}

void apagarUser(String user) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/$user");
  ref.set(null);
}

void mudarQntOld(String user, int index, int qnt, Map prod) async {
  List carrinho = [];
  Map produto = prod;
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/$user/Carrinho').get();
  if (snapshot.exists) {
    snapshot.children.forEach((e) => carrinho.add(e.value));
    //produto = carrinho.elementAt(index);
    //produto = {'name': produto["name"], 'quantida': qnt};
    carrinho.removeAt(index);
    carrinho.insert(index, produto);
    update(user, carrinho);
  }
}

void alterarQnt(String user, int index, int qnt, Map prod) async {
  List carrinho = [];
  Map produto = prod;
  Map oldProd;
  num newQnt = qnt;
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/$user/Carrinho').get();
  if (snapshot.exists) {
    snapshot.children.forEach((e) => carrinho.add(e.value));
    oldProd = carrinho.elementAt(index);
    produto['quantidade'] = newQnt;
    carrinho.removeAt(index);
    carrinho.insert(index, produto);
    update(user, carrinho);
  }
}

void mudarQnt(String user, int index, int qnt, Map prod) async {
  List carrinho = [];
  Map produto = prod;
  Map oldProd;
  num newQnt = qnt;
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/$user/Carrinho').get();
  if (snapshot.exists) {
    snapshot.children.forEach((e) => carrinho.add(e.value));
    oldProd = carrinho.elementAt(index);
    newQnt += oldProd['quantidade'];
    produto['quantidade'] = newQnt;
    carrinho.removeAt(index);
    carrinho.insert(index, produto);
    update(user, carrinho);
  }
}

Future<int> verificaLoja(String id, String user) async {
  List carrinho = [];
  Map produto;
  int aux = 1;
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/$user/Carrinho').get();
  if (snapshot.exists) {
    snapshot.children.forEach((e) => carrinho.add(e.value));
    produto = carrinho.elementAt(0);
    if(produto['idLoja'] != id) {
      aux = -1;
    } else {
      aux = 1;
    }
  }

  return aux;
}

Future<int> verificaProduto(String idProduto, String user) async {
  List carrinho = [];
  int index = -1;
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/$user/Carrinho').get();
  if (snapshot.exists) {
    snapshot.children.forEach((e) => carrinho.add(e.value));
    for (int i=0; i < carrinho.length; i++) {
      if(carrinho[i]['idProduto'] == idProduto) {
        index = i;
        break;
      } else {
        index = -2;
      }
    }
  }

  print(index);

  return index;
}


Stream<List<Produto>> getProduto(String idLoja, String idProduto) => FirebaseFirestore.instance
    .collection("lojas")
    .doc(idLoja)
    .collection('produtos')
    .where("id", isEqualTo: idProduto)
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) => Produto.fromJson(doc.data())).toList());

Future<List<num>> getTaxa(String idLoja) => FirebaseFirestore.instance
    .collection("lojas")
    .where("id", isEqualTo: idLoja)
    .get()
    .then((snapshot) =>
    snapshot.docs.map((doc) => Loja.fromJson(doc.data()).taxa).toList());

// Future<num> getValor(String idLoja, String idProduto) => FirebaseFirestore.instance
//     .collection("lojas")
//     .doc(idLoja)
//     .collection('produtos')
//     .doc(idProduto)
//     .get()
//     .then((doc) => Produto.fromJson(doc.data()!).valor);


