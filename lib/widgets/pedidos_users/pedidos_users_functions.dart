import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tier/firebase/pedido_helper.dart';

Future criarPedido(Pedido pedido) async {
  final docPedido = FirebaseFirestore.instance.collection('pedidos').doc();

  Pedido pedidoUser = pedido;

  final json = pedidoUser.toJson();

  await docPedido.set(json);
}

Stream<List<Pedido>> readPedidos(String user) => FirebaseFirestore.instance
    .collection("pedidos")
    .where('idUser', isEqualTo: user)
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) => Pedido.fromJson(doc.data())).toList());