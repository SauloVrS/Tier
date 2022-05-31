import 'package:tier/widgets//busca_widget.dart';
import 'package:tier/views/lista_itens.dart';
import 'package:tier/views/lista_lojas.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class BuscaItens extends StatefulWidget {
  final String text;
  const BuscaItens({Key? key, required this.text}) : super(key: key);

  @override
  State<BuscaItens> createState() => _BuscaItensState();
}

class _BuscaItensState extends State<BuscaItens> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const BuscaWidget(),
            elevation: 3,
            toolbarHeight: MediaQuery.of(context).size.height / 10,
            //centerTitle: true,
            backgroundColor: Colors.white,
            bottom: const TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 3.5,
              tabs: [
                Tab(
                  child: Text(
                    'Lojas',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Produtos',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListaLojas(text: widget.text,),
              ListaItens(text: widget.text,),
            ],
          ),
          bottomNavigationBar: const BottomNavBar(pagina: 'search'),
        ),
      );
}
