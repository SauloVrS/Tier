import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors.dart';
import '../../../widgets/bottom_nav_bar.dart';

class AssinaturaSecond extends StatefulWidget {
  const AssinaturaSecond({Key? key}) : super(key: key);

  @override
  State<AssinaturaSecond> createState() => _AssinaturaSecondState();
}

class _AssinaturaSecondState extends State<AssinaturaSecond> {
  int qnt = 1;

  aumentar() {
    setState(() {
      qnt++;
    });
  }

  diminuir() {
    setState(() {
      if (qnt == 1) {
        qnt = 1;
      } else {
        qnt--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Container(
          margin: EdgeInsetsDirectional.fromSTEB(58, 0, 0, 0),
          child: const Text(
            'ASSINATURA',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              color: Color.fromRGBO(167, 166, 166, 0.2),
              height: 1.2,
            ),
            preferredSize: const Size.fromHeight(1.2)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.cinzaBranco.withOpacity(0.5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width - 50) / 4,
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Image.asset('images/sacola_pata.png'),
                      ),
                      Container(
                        width:
                            ((MediaQuery.of(context).size.width - 50) / 4) * 3,
                        child: const Text(
                          'Produtos Assinados', // integrar com firebase.
                          style: TextStyle(
                            color: Color.fromARGB(204, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                child: Column(children: [
                  Container(
                    color: AppColor.cinzaBranco,
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        qntProd(),
                        const SizedBox(
                          width: 15,
                        ),
                        //Expanded(child: addProd(context))
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'perfil'),
    );
  }

  Widget qntProd() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColor.cinzaBranco, style: BorderStyle.solid)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => diminuir(),
            child: const Icon(Icons.remove_rounded),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              qnt.toString(),
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 15,
              )),
            ),
          ),
          GestureDetector(
            onTap: () => aumentar(),
            child: const Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
