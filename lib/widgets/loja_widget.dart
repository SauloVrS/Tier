import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LojaWidget extends StatelessWidget {
  final String imagem;
  final String nomeLoja;
  final double nota;
  final double distancia;
  final bool isOpen;
  final int tempoMinimo;
  final int tempoMaximo;
  final double precoEntrega;

  const LojaWidget({
    Key? key,
    required this.imagem,
    required this.distancia,
    required this.isOpen,
    required this.nomeLoja,
    required this.nota,
    required this.precoEntrega,
    required this.tempoMaximo,
    required this.tempoMinimo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        children: [
          Container(
            //decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: ImageProvider(image))),
            height: 90,
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Image.asset(imagem, fit: BoxFit.cover,),
            )
            // CircleAvatar(
            //   backgroundImage: AssetImage(imagem),
            //   radius: 64,
            // ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nomeLoja,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                  ),
                  const SizedBox(width: 4),
                  Text('$nota'),
                  const SizedBox(width: 4),
                  const FaIcon(
                    FontAwesomeIcons.solidCircle,
                    size: 8,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text('$distancia km'),
                  const SizedBox(width: 4),
                  const FaIcon(
                    FontAwesomeIcons.solidCircle,
                    size: 8,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(isOpen ? 'Aberto' : 'Fechado'),
                ],
              ),
              Row(
                children: [
                  Text('$tempoMinimo - $tempoMaximo min'),
                  const SizedBox(width: 4),
                  const FaIcon(
                    FontAwesomeIcons.solidCircle,
                    size: 8,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text('R\$ $precoEntrega')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
