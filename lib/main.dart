import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tier/firebase/firebase_tier.dart';
import 'package:tier/widgets/auth_widgets/login_page.dart';
import 'package:tier/views/main_lojas.dart';

import 'views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tier',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(), // ADICIONAR COMPONENTE SPLASH AQUI
    );
  }
}
