import 'package:tier/widgets/loja_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/bottom_nav_bar.dart';

class ListaLojas extends StatefulWidget {
  //final String pesquisa;
  const ListaLojas({Key? key}) : super(key: key);

  @override
  State<ListaLojas> createState() => _ListaLojasState();
}

class _ListaLojasState extends State<ListaLojas> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Filtro(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text('Resultados Semelhantes a ração',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),),
          ),
          ListView(
            shrinkWrap: true,
            children: const [
              LojaWidget(
                imagem: 'images/loja_racao1.jpg',
                distancia: 1.1,
                isOpen: true,
                nomeLoja: 'Top Rações',
                nota: 4.3,
                precoEntrega: 7.89,
                tempoMaximo: 70,
                tempoMinimo: 50,
              ),
              LojaWidget(
                imagem: 'images/imagem_loja_racao.jpg',
                distancia: 2.4,
                isOpen: false,
                nomeLoja: 'Rações HercoSul',
                nota: 3.7,
                precoEntrega: 4.63,
                tempoMaximo: 80,
                tempoMinimo: 40,
              ),
              LojaWidget(
                imagem: 'images/loja_racao_novo.jpg',
                distancia: 5.7,
                isOpen: true,
                nomeLoja: 'Atacadão da Ração',
                nota: 2.8,
                precoEntrega: 12.53,
                tempoMaximo: 90,
                tempoMinimo: 60,
              ),
              LojaWidget(
                imagem: 'images/loja_racao4.jpg',
                distancia: 4.2,
                isOpen: false,
                nomeLoja: 'Ração em Casa',
                nota: 5.0,
                precoEntrega: 12.67,
                tempoMaximo: 40,
                tempoMinimo: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
