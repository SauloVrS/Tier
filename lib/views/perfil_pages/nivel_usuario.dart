import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';
import '../../widgets/bottom_nav_bar.dart';

class NivelUsuario extends StatefulWidget {
  const NivelUsuario({Key? key}) : super(key: key);

  @override
  State<NivelUsuario> createState() => _NivelUsuarioState();
}

class _NivelUsuarioState extends State<NivelUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 150,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: const Color.fromRGBO(27, 27, 27, 0.8),
                  ),
                  height: 40,
                  width: (MediaQuery.of(context).size.width) * 0.1,
                  //color: Colors.black,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) * 0.145,
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Image.asset('images/bronze.png'),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 50, 0, 0),
                  child: const Text(
                    'Bronze I',
                    style: TextStyle(
                      color: Color.fromRGBO(27, 27, 27, 0.8),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  // implementar firebase.
                  height: (MediaQuery.of(context).size.width) * 0.21,
                  width: (MediaQuery.of(context).size.width) * 0.21,
                  margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Stack(fit: StackFit.expand, children: const [
                    CircularProgressIndicator(
                      backgroundColor: Color.fromRGBO(255, 195, 104, 0.7),
                      value: 0.78,
                      strokeWidth: 16,
                      valueColor: AlwaysStoppedAnimation(
                        Color.fromRGBO(237, 164, 23, 1),
                      ),
                    ),
                    Center(
                      child: Text(
                        '78%',
                        style: TextStyle(
                          color: Color.fromRGBO(166, 93, 80, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                      child: const Text(
                        '78', // integar com firebase.
                        style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 0.8),
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 30, 0, 0),
                      child: const Text(
                        '/100 pontos', // integrar com firebase.
                        style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: const Text(
                        'Próximo\n  Nível:', // integrar com firebase.
                        style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                      child:
                          Image.asset('images/bronze.png'), //integrar firebase
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                      child: const Text(
                        'Bronze II', // integrar com firebase.
                        style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    height: 120,
                    width: (MediaQuery.of(context).size.width) - 60,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(229, 229, 229, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: const Icon(
                                Icons.wallet_giftcard_outlined,
                                size: 35,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Resgate de recompensas', // integrar com firebase.
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: const Text(
                            'Não há recopensas disponiveis no momento\n Chegue ao proximo nivel e tenha acesso a\n                  prêmios exclusivos.',
                            style: TextStyle(
                              color: Color.fromRGBO(27, 27, 27, 0.8),
                              //fontSize: 20,
                              //fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: const Icon(
                        Icons.workspace_premium_outlined,
                        size: 35,
                        color: Color.fromRGBO(27, 27, 27, 0.8),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 30, 0, 0),
                      child: const Text(
                        'Recompensas', // integrar com firebase.
                        style: TextStyle(
                          color: Color.fromRGBO(27, 27, 27, 0.8),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 220,
                    width: (MediaQuery.of(context).size.width) - 60,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(197, 105, 20, 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                              child: const Text(
                                'Bronze', // integrar com firebase.
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                              child: Image.asset(
                                  'images/bronze.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/bronze.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/bronze.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/bronze.png'), //integrar firebase
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'I',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(21, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Cupom de Boas Vindas',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                              child: const Text(
                                'II',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Bronze II',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: const Text(
                                'III',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Bronze III',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: const Text(
                                'IV',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Bronze IV',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 220,
                    width: (MediaQuery.of(context).size.width) - 60,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(205, 208, 227, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                              child: const Text(
                                'Prata', // integrar com firebase.
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                              child: Image.asset(
                                  'images/prata.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/prata.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/prata.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/prata.png'), //integrar firebase
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'I',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(21, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Prata I',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                              child: const Text(
                                'II',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Prata II',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: const Text(
                                'III',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Prata III',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: const Text(
                                'IV',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Prata IV',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    height: 220,
                    width: (MediaQuery.of(context).size.width) - 60,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 215, 0, 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                              child: const Text(
                                'Ouro', // integrar com firebase.
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                              child: Image.asset(
                                  'images/ouro.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/ouro.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/ouro.png'), //integrar firebase
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.fromLTRB(10, 18, 0, 0),
                              child: Image.asset(
                                  'images/ouro.png'), //integrar firebase
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'I',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(21, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Ouro I',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                              child: const Text(
                                'II',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Ouro II',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: const Text(
                                'III',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Ouro III',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: const Text(
                                'IV',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                size: 25,
                                color: Color.fromRGBO(27, 27, 27, 0.8),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: const Text(
                                'Recompensa Ouro IV',
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'perfil'),
    );
  }
}
