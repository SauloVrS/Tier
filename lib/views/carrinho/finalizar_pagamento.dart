import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tier/widgets/carrinho_widgets/modal_mudar_endereco.dart';

import '../../colors.dart';
import '../../firebase/pedido_helper.dart';
import '../../widgets/carrinho_widgets/carrinho_functions.dart';
import '../../widgets/carrinho_widgets/metodo_pagamento.dart';
import '../../widgets/pedidos_users/pedidos_users_functions.dart';

class FinalPagamento extends StatefulWidget {
  final Pedido pedido;
  final IconData icon;
  const FinalPagamento({Key? key, required this.pedido, required this.icon}) : super(key: key);

  @override
  State<FinalPagamento> createState() => _FinalPagamentoState();
}

class _FinalPagamentoState extends State<FinalPagamento> {
  num subtotal = 0;
  num taxa = 0;
  var user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubtotal(user!.uid);
    getTaxa(widget.pedido.carrinho![0]['idLoja']).then((value) =>
        setState((){
          taxa = value[0];
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Efetuar pagamento',
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
            mapEndereco(context),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: () =>
                showMaterialModalBottomSheet(
                    expand: false,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => MudarLocal(onTap: mudarEnd,)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    color: AppColor.textosPretos2,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Alterar endereço',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    )
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Subtotal',
                        style: GoogleFonts.poppins(
                            color: Colors.grey
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'R\$ ${subtotal.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(
                        'Taxa de entrega',
                        style: GoogleFonts.poppins(
                            color: Colors.grey
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'R\$ ${taxa.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'R\$ ${widget.pedido.valor!.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pagamentoType(widget.icon, widget.pedido.pagamento!),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    color: AppColor.textosPretos2,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Alterar forma de pagamento',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () async {
                widget.pedido.status = 'Em andamento';
                criarPedido(widget.pedido);
                apagarUser(user!.uid);
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    color: AppColor.amareloEscuro,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Realizar pedido',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        )
      ),
    );
  }

  void mudarEnd(Endereco endereco){
    setState(() {
      widget.pedido.endereco = endereco;
    });
  }

  getSubtotal(String user) async {
    var _ref = FirebaseDatabase.instance.ref('users/$user/Carrinho');

    _ref.onValue.listen((DatabaseEvent event) {
      setState(() {
        List listAux = (event.snapshot.value ?? []) as List;
        subtotal = 0;
        listAux.forEach((element) {
          subtotal += element["valor"] * element['quantidade'];
        });
      });
    });

    _ref.onChildChanged.listen((DatabaseEvent event) {
      setState(() {
        List listAux = (event.snapshot.value ?? []) as List;
        subtotal = 0;
        listAux.forEach((element) {
          subtotal += element["valor"] * element['quantidade'];
        });
      });
    });

  }

  Widget mapEndereco(BuildContext context){
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width - 30,
                child: Image.asset('./images/greymap.jpg', fit: BoxFit.cover,),
              ),
              const SizedBox(height: 60,)
            ],
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.cinzaClaro, width: 0.8),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Entregar em:',
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 7,),
                  Text(
                    '${widget.pedido.endereco!.rua}, ${widget.pedido.endereco!.numero}',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 7,),
                  Text(
                    '${widget.pedido.endereco!.bairro}  -  ${widget.pedido.endereco!.cidade}',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}


