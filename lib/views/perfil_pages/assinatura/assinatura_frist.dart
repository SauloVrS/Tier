import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/perfil_pages/assinatura/assinatura_second.dart';
import 'package:tier/views/perfil_pages/assinatura/prodAssinados.dart';

import '../../../widgets/bottom_nav_bar.dart';
import '../../main_lojas.dart';

class Assinatura extends StatefulWidget {
  const Assinatura({Key? key}) : super(key: key);

  @override
  State<Assinatura> createState() => _AssinaturaState();
}

class _AssinaturaState extends State<Assinatura> {
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
          //alignment: Alignment.topCenter,
          //margin: EdgeInsetsDirectional.fromSTEB(58, 0, 0, 0),
          child: const Text(
            'ASSINATURA',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                height: 250,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.cinzaBranco.withOpacity(0.5),
                ),
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 50) / 2,
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 50),
                      child: Image.asset('images/sacola_vermelha.png'),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 50) / 2,
                      child: const Text(
                        'A assinatura é um serviço que automatiza a compra dos produtos que seu pet precisa e garante 10% off de desconto nos produtos', // integrar com firebase.
                        style: TextStyle(
                          color: Color.fromARGB(204, 0, 0, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: const Text(
                  'Como funciona?',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    height: 100,
                    width: (MediaQuery.of(context).size.width - 50) / 4,
                    child: Image.asset('images/sacola_pata.png'),
                  ),
                  Container(
                    height: 100,
                    width: ((MediaQuery.of(context).size.width - 50) / 4) * 3,
                    child: const Center(
                      child: Text(
                        '1. Você escolhe quais produtos deseja assinar',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 22, 0, 22),
                    height: 100,
                    width: (MediaQuery.of(context).size.width - 50) / 4,
                    child: Image.asset('images/calendario.png'),
                  ),
                  Container(
                    height: 100,
                    width: ((MediaQuery.of(context).size.width - 50) / 4) * 3,
                    child: const Center(
                      child: Text(
                        '2. Escolhe a frequência de entrega   (ex.: a cada 2 meses)',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    height: 100,
                    width: (MediaQuery.of(context).size.width - 50) / 4,
                    child: Image.asset('images/dinheiro.png'),
                  ),
                  Container(
                    height: 100,
                    width: ((MediaQuery.of(context).size.width - 50) / 4) * 3,
                    child: const Center(
                      child: Text(
                        '3. Adiciona seus dados (de pagamento e de endereço)',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    height: 100,
                    width: (MediaQuery.of(context).size.width - 50) / 4,
                    child: Image.asset('images/casa.png'),
                  ),
                  Container(
                    height: 100,
                    width: ((MediaQuery.of(context).size.width - 50) / 4) * 3,
                    child: const Center(
                      child: Text(
                        '4. Pronto! Os próximos pedidos serão fechados automaticamente',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProdAssinados(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 40),
                    height: 60,
                    width: (MediaQuery.of(context).size.width - 100),
                    decoration: BoxDecoration(
                      color: AppColor.amareloEscuro,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Produtos Assinados',
                        style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'perfil'),
    );
  }
}
