import 'dart:ffi';

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tier/firebase/adicionar_imagens.dart';
import 'package:tier/firebase/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:tier/views/perfil_pages/meu_perfil.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';
import 'package:tier/widgets/auth_widgets/recuperar_senha.dart';
import 'package:tier/views/splash_screen.dart';
import 'package:tier/widgets/auth_widgets/cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorText;
  String errorText = "";
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? TextErrorEmpty(String? Text) {
    String? TextError;
    if (Text == 'error-E') {
      TextError = "Preencha todos os campos";
    } else if (Text ==
        'The password is invalid or the user does not have a password.') {
      TextError = "Valores inválidos";
    } else {
      TextError = null;
    }
    return TextError;
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String? res = await AuthMethod().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res == 'Login efetuado com sucesso!') {
      _emailController.text = '';
      _passwordController.text = '';
      _errorText = res;
      showSnackBar(errorText, context);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => TelaPerfilUsuario(),
        ),
      );
    } else if (res ==
        'The password is invalid or the user does not have a password') {
      errorText = 'Senha incorreta';
      showSnackBar(res, context);
    } else if (res == 'Preencha os campos!') {
      errorText = res;
      showSnackBar(errorText, context);
    }
    showSnackBar(res, context);
  }

  void loginGoogle() async {
    setState(() {
      _isLoading = true;
    });
    String? res = await AuthMethod().googleLogin();

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => TelaPerfilUsuario(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cinzaBranco,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 20,
                      color: AppColor.cinzaclaroAppBar,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: TextField(
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 20,
                      color: AppColor.cinzaclaroAppBar,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: AppColor.amareloPrincipal,
                ),
              ),
              onPressed: () {
                showCupertinoModalBottomSheet(
                    elevation: MediaQuery.of(context).size.height / 4,
                    bounce: true,
                    topRadius: Radius.circular(40),
                    barrierColor: Color.fromARGB(150, 0, 0, 0),
                    context: context,
                    builder: (context) => Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          child: RecuperarSenha(),
                        ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Esqueceu a senha?',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: AppColor.amareloPrincipal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)),
                  primary: AppColor.amareloEscuro,
                ),
                onPressed: loginUser,
                child: Text(
                  'Entrar',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColor.textoBranco,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Text(
              'Ou',
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: AppColor.textosPretos3,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.facebook,
                  color: Color.fromARGB(255, 243, 243, 243),
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)),
                  primary: Color(0xFF1877F2),
                ),
                onPressed: () {},
                label: Text(
                  'Entrar com o Facebook',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColor.textoBranco,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton.icon(
                icon: Image.asset(
                  'images/google_icon.png',
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 10,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)),
                  primary: AppColor.textoBranco,
                ),
                onPressed: loginGoogle,
                label: Text(
                  'Entrar com o Google ',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColor.cinzaescuroAppBar,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
          ],
        ),
      ),
    );
  }
}
