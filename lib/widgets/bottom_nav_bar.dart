import 'package:flutter/material.dart';
import 'package:tier/views/pet_pages/adocao-home.dart';
import 'package:tier/views/busca_principal.dart';
import 'package:tier/views/fav_lojas.dart';
import 'package:tier/views/main_lojas.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';

class BottomNavBar extends StatelessWidget {
  final String pagina;

  const BottomNavBar({Key? key, required this.pagina}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => MainLojas(),
                  )
              );
            },
            icon: Icon(
              Icons.shopping_bag,
              size: 18,
              color: pagina == "lojas" ? Colors.black : const Color(0xFFD6D6D6),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => const BuscaPrincipal(),
                  )
              );
            },
            icon: Icon(
              Icons.search,
              size: 18,
              color: pagina == "search" ? Colors.black : const Color(
                  0xFFD6D6D6),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => AdocaoHome(),
                  )
              );
            },
            icon: Icon(
              Icons.pets,
              size: 26,
              color: pagina == "pet" ? Colors.black : const Color(0xFFD6D6D6),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => const FavLojas2(),
                  )
              );
            },
            icon: Icon(
              Icons.star_border_rounded,
              size: 18,
              color: pagina == "fav" ? Colors.black : const Color(0xFFD6D6D6),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => TelaPerfilUsuario(),//COLOCAR O CENTER SE NÃO TIVER ESSA PAGINA NO SEU ARQUIVO
                  )
              );
            },
            icon: Icon(
              Icons.person_outline_rounded,
              size: 18,
              color: pagina == "perfil" ? Colors.black : const Color(
                  0xFFD6D6D6),
            ),
          ),
        ],
      ),
    );
  }
}
