import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/widgets/pedidos_users/em_andamento.dart';
import 'package:tier/widgets/pedidos_users/finalizados.dart';

import '../../colors.dart';

class MeusPedidos extends StatefulWidget {
  const MeusPedidos({Key? key}) : super(key: key);

  @override
  State<MeusPedidos> createState() => _MeusPedidosState();
}

class _MeusPedidosState extends State<MeusPedidos> {
  bool aux = true;
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus Pedidos',
          style: GoogleFonts.poppins(
              fontSize: 18,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: aux == true ? const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2.0, color: Colors.black, )
                        )
                    ) : null,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          aux = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Em andamento',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: Container(
                    decoration: aux != true ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2.0, color: Colors.black, )
                      )
                    ) : null,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          aux = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Finalizados',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            user?.uid == null ? Container() : (aux == true ? const EmAndamento() : const Finalizados())
          ],
        ),
      ),
    );
  }
}
