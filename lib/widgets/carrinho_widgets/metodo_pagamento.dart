import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';

class MetodoDePagamento extends StatefulWidget {
  const MetodoDePagamento({Key? key}) : super(key: key);

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
              onTap: (){},
              child: pagamentoType(Icons.credit_card, 'Cartão de crédito/débito')
            ),
            GestureDetector(
                onTap: (){},
                child: pagamentoType(Icons.pix, 'Pix')
            ),
            GestureDetector(
                onTap: (){},
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
