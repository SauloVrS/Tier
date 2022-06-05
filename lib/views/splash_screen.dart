import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tier/views/main_lojas.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 50,
      splash: Image.asset('images/img.png'),
      nextScreen: const MainLojas(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
