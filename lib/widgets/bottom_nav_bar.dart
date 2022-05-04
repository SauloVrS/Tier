import 'package:flutter/material.dart';
import 'package:tier/views/main_lojas.dart';

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
                    builder: (context) => Center( // SUBSTITUIR O CENTER PELA PAGINA RELACIONADA
                      child: ElevatedButton(
                        onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainLojas())); },
                        child: const Text("Voltar"),
                      ),
                    ),
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
                    builder: (context) => Center( // SUBSTITUIR O CENTER PELA PAGINA RELACIONADA
                      child: ElevatedButton(
                        onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainLojas())); },
                        child: const Text("Voltar"),
                      ),
                    ),
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
                    builder: (context) => Center( // SUBSTITUIR O CENTER PELA PAGINA RELACIONADA
                      child: ElevatedButton(
                        onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainLojas())); },
                        child: const Text("Voltar"),
                      ),
                    ),
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
                    builder: (context) => Center( // SUBSTITUIR O CENTER PELA PAGINA RELACIONADA
                      child: ElevatedButton(
                        onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainLojas())); },
                        child: const Text("Voltar"),
                      ),
                    ),
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
                    builder: (context) => Center( // SUBSTITUIR O CENTER PELA PAGINA RELACIONADA
                      child: ElevatedButton(
                        onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainLojas())); },
                        child: const Text("Voltar"),
                      ),
                    ),
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
