import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/models/users_model.dart';

import '../firebase/loja_helper.dart';
import '../views/loja_page.dart';

Widget lojaList(Loja loja, int espacamento, BuildContext context,ModelUsers user) {
  return GestureDetector(
    onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => LojaPage(loja: loja, user: user,))),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 80,
      width: MediaQuery.of(context).size.width - (espacamento),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                loja.imgUrl,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                color: !loja.status
                    ? Colors.white.withOpacity(0.25)
                    : Colors.white.withOpacity(1),
                colorBlendMode: BlendMode.modulate,
              )),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(loja.nome,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: loja.status ? Colors.black : Colors.grey),
                  )),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.star,
                        color:
                            loja.status ? Colors.yellowAccent : Colors.yellow,
                        size: 14,
                      )),
                  Text(
                    loja.avaliacao.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.circle,
                          color: loja.status ? Colors.black : Colors.grey,
                          size: 5)),
                  Text(
                    '${loja.distancia.toString()} km',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.circle,
                          color: loja.status ? Colors.black : Colors.grey,
                          size: 5)),
                  Text(
                    loja.status ? "aberto" : "fechado",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Text(
                    '${loja.tempMin.toString()} - ${loja.tempMax.toString()} min',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.circle,
                          color: loja.status ? Colors.black : Colors.grey,
                          size: 5)),
                  Text(
                    'R\$ ${loja.taxa.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: loja.status ? Colors.black : Colors.grey),
                    )
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

class LojasList extends StatelessWidget {
  final String name, imgUrl;
  final num stars, distancia, taxa, tempoMin, tempoMax;
  final bool situacao;
  final int espacamento; //minimo é 30 (30 na home)

  const LojasList(
      {Key? key,
      required this.name,
      required this.imgUrl,
      required this.stars,
      required this.distancia,
      required this.tempoMin,
      required this.tempoMax,
      required this.taxa,
      required this.situacao,
      required this.espacamento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 80,
      width: MediaQuery.of(context).size.width - (espacamento),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imgUrl,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                color: !situacao
                    ? Colors.white.withOpacity(0.25)
                    : Colors.white.withOpacity(1),
                colorBlendMode: BlendMode.modulate,
              )),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: situacao ? Colors.black : Colors.grey),
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.star,
                        color: situacao ? Colors.yellowAccent : Colors.yellow,
                        size: 14,
                      )),
                  Text(
                    stars.toString(),
                    style: TextStyle(
                        fontSize: 10,
                        color: situacao ? Colors.black : Colors.grey),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.circle,
                          color: situacao ? Colors.black : Colors.grey,
                          size: 5)),
                  Text(
                    '${distancia.toString()} km',
                    style: TextStyle(
                        fontSize: 10,
                        color: situacao ? Colors.black : Colors.grey),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.circle,
                          color: situacao ? Colors.black : Colors.grey,
                          size: 5)),
                  Text(
                    situacao ? "aberto" : "fechado",
                    style: TextStyle(
                        fontSize: 10,
                        color: situacao ? Colors.black : Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Text(
                    '${tempoMin.toString()} - ${tempoMax.toString()} min',
                    style: TextStyle(
                        fontSize: 10,
                        color: situacao ? Colors.black : Colors.grey),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.circle,
                          color: situacao ? Colors.black : Colors.grey,
                          size: 5)),
                  Text(
                    'R\$ ${distancia.toString()}',
                    style: TextStyle(
                        fontSize: 10,
                        color: situacao ? Colors.black : Colors.grey),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
