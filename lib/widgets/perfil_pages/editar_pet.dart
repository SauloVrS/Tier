import 'package:flutter/material.dart';

import '../bottom_nav_bar.dart';

class EditarPet extends StatefulWidget {
  const EditarPet({Key? key}) : super(key: key);

  @override
  _EditarPetState createState() => _EditarPetState();
}

class _EditarPetState extends State<EditarPet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Tela de editar pet'),),
      bottomNavigationBar: const BottomNavBar(pagina: 'perfil'),
    );
  }
}
