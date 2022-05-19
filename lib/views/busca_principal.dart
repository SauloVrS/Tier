import 'package:flutter/material.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';

import '../widgets/busca_widget.dart';
import '../widgets/carroussel_image.dart';
import '../widgets/experimente_buscar.dart';

class BuscaPrincipal extends StatelessWidget {
  const BuscaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BuscaWidget(),
            Carrousselimage(),
            const Experimentebuscar()
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(pagina: "search"),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
