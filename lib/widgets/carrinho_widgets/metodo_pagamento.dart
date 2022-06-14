import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/carrinho/finalizar_pagamento.dart';

import '../../firebase/pedido_helper.dart';

class MetodoDePagamento extends StatefulWidget {
  final Pedido pedido;
  const MetodoDePagamento({Key? key, required this.pedido}) : super(key: key);

  @override
  State<MetodoDePagamento> createState() => _MetodoDePagamentoState();
}

class _MetodoDePagamentoState extends State<MetodoDePagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formas de pagamento',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: AppColor.cinzaescuroAppBar,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                widget.pedido.pagamento = 'Cartão de crédito/débito';
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  FinalPagamento(pedido: widget.pedido, icon: Icons.credit_card,))
                );
              },
              child: pagamentoType(Icons.credit_card, 'Cartão de crédito/débito')
            ),
            GestureDetector(
                onTap: (){
                  widget.pedido.pagamento = 'Pix';
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  FinalPagamento(pedido: widget.pedido, icon: Icons.pix,))
                  );
                },
                child: pagamentoType(Icons.pix, 'Pix')
            ),
            GestureDetector(
                onTap: (){
                  widget.pedido.pagamento = 'Dinheiro';
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>  FinalPagamento(pedido: widget.pedido, icon: Icons.local_atm,))
                  );
                },
                child: pagamentoType(Icons.local_atm, 'Dinheiro')
            ),
          ],
        ),
      ),
    );
  }
}

Widget pagamentoType(IconData icon, String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.cinzaClaro, width: 0.8),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 10,),
        Text(text, style: GoogleFonts.poppins(),)
      ],
    ),
  );
}
