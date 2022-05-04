import 'package:flutter/material.dart';
import 'package:tier/views/main_lojas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainLojas(), // ADICIONAR COMPONENTE SPLASH AQUI
    );
  }
}


