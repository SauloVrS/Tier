import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/widgets/carrinho_widgets/carrinho_itens.dart';
import 'package:tier/widgets/carrinho_widgets/carrinho_vazio.dart';

import '../../colors.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  List list = [];
  late final DatabaseReference _ref;
  late StreamSubscription<DatabaseEvent> _subscrip;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init("André");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho',
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
      body: list.isEmpty ? carrinhoVazio(context) : Carrinho(list: list, context: context),
    );
  }

  init(String user) async {
    _ref = FirebaseDatabase.instance.ref('users/$user/Carrinho');
    try {
      final snapshot = await _ref.get();
      list = snapshot.value as List;
    } catch (e) {
      print(e.toString());
    }

    _subscrip = _ref.onValue.listen((DatabaseEvent event) {
      setState(() {
        list = (event.snapshot.value ?? []) as List;
      });
    });
  }
}
