import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/perfil_pages/assinatura/prodAssinados.dart';

import '../../../colors.dart';
import '../../../firebase/produto_helper.dart';
import '../../../widgets/bottom_nav_bar.dart';

class AssinaturaSecond extends StatefulWidget {
  final Produto produto;
  const AssinaturaSecond({Key? key, required this.produto}) : super(key: key);

  @override
  State<AssinaturaSecond> createState() => _AssinaturaSecondState();
}

class _AssinaturaSecondState extends State<AssinaturaSecond> {
  int qnt = 1;
  final controllerPeriodo = TextEditingController();

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
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdAssinados(),
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.amareloPrincipal,
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
              const SizedBox(
                height: 30,
              ),
              Container(
                color: AppColor.cinzaClaro,
                width: MediaQuery.of(context).size.width,
                height: 1,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 180,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 4,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Image.network(
                            widget.produto.imgUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: qntProd(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: (MediaQuery.of(context).size.width / 4) * 2.5,
                          alignment: Alignment.bottomCenter,
                          //margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            widget.produto.nome,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          height: 35,
                          width: (MediaQuery.of(context).size.width / 4) * 2,
                          child: TextField(
                            controller: controllerPeriodo,
                            decoration: InputDecoration(
                              labelText: 'Periodo em semanas',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   color: AppColor.cinzaClaro,
              //   width: MediaQuery.of(context).size.width,
              //   height: 1,
              // ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        //width: ((MediaQuery.of(context).size.width - 50) / 4) * 2.5,
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "R\$ ${(qnt * widget.produto.novoValor).toStringAsFixed(2)}",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough),
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        //width: ((MediaQuery.of(context).size.width - 50) / 4) * 2.5,
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "R\$ ${((qnt * widget.produto.novoValor) * 90 / 100).toStringAsFixed(2)}",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      final assin = AssinaturaDados(
                        idProduto: widget.produto.id,
                        periodo: controllerPeriodo.text,
                        qnt: qnt,
                        valor: ((qnt * widget.produto.novoValor) * 90 / 100),
                        imgUrl: widget.produto.imgUrl,
                        nomeProd: widget.produto.nome,
                      );

                      createAssinatura(assin);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProdAssinados(),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                      height: 50,
                      width: (MediaQuery.of(context).size.width - 200),
                      decoration: BoxDecoration(
                        color: AppColor.amareloEscuro,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Assinar',
                          style: TextStyle(
                            color: Color.fromRGBO(27, 27, 27, 0.8),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: AppColor.cinzaClaro,
                width: MediaQuery.of(context).size.width,
                height: 1,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'lojas'),
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

Future createAssinatura(AssinaturaDados assin) async {
  String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

  final docUser = FirebaseFirestore.instance
      .collection('usuarios')
      .doc(currentUserId)
      .collection('assinatura')
      .doc();
  //assin. = docUser.id;
  final json = assin.toJson();
  await docUser.set(json);
}

class AssinaturaDados {
  String idProduto;
  final String periodo;
  final int qnt;
  final double valor;
  final String imgUrl;
  final String nomeProd;

  AssinaturaDados({
    this.idProduto = '',
    required this.periodo,
    required this.qnt,
    required this.valor,
    required this.imgUrl,
    required this.nomeProd,
  });

  Map<String, dynamic> toJson() => {
        'idProduto': idProduto,
        'periodo': periodo,
        'qnt': qnt,
        'valor': valor,
        'imgUrl': imgUrl,
        'nomeProd': nomeProd,
      };

  static AssinaturaDados fromJson(Map<String, dynamic> json) => AssinaturaDados(
        idProduto: json['idProduto'],
        periodo: json['periodo'],
        qnt: json['qnt'],
        valor: json['valor'],
        imgUrl: json['imgUrl'],
        nomeProd: json['nomeProd'],
      );
}
