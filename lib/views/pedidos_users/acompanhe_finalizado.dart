import 'package:flutter/material.dart';
import '../../firebase/pedido_helper.dart';

class AcompanheFinalizado extends StatefulWidget {
  final Pedido pedido;
  const AcompanheFinalizado({Key? key, required this.pedido}) : super(key: key);

  @override
  State<AcompanheFinalizado> createState() => _AcompanheFinalizadoState();
}

class _AcompanheFinalizadoState extends State<AcompanheFinalizado> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('Em construção')),
    );
  }
}
