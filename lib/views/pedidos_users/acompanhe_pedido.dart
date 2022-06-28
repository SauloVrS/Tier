import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/pedidos_users/acompanhe_andamento.dart';

import '../../colors.dart';
import '../../firebase/pedido_helper.dart';
import '../chat/screens/chat_home_screen.dart';
import 'acompanhe_finalizado.dart';

class AcompanhePedido extends StatefulWidget {
  final Pedido pedido;
  const AcompanhePedido({Key? key, required this.pedido}) : super(key: key);

  @override
  State<AcompanhePedido> createState() => _AcompanhePedidoState();
}

class _AcompanhePedidoState extends State<AcompanhePedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Acompanhe seu pedido',
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: AppColor.cinzaescuroAppBar,
        actions: [
          widget.pedido.status == 'Em andamento' ? IconButton(
              onPressed:
                  () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  )
              ),
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.chat_bubble_rounded,
                color: Colors.black,
                size: 18,
              )
          ) : Container()
        ],
      ),
      backgroundColor: Colors.white,
      body: widget.pedido.status == 'Em andamento' ||  widget.pedido.status == 'A caminho' ? AcompanheAndamento(pedido: widget.pedido) : AcompanheFinalizado(pedido: widget.pedido),
    );
  }
}
