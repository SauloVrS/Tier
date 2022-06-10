import 'dart:ui';
import 'package:tier/firebase/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/adocao-home.dart';
import 'package:tier/views/auth_page.dart';
import 'package:tier/views/chat/screens/chat_home_screen.dart';
import 'package:tier/views/perfil_pages/configuracoes_perfil.dart';
import 'package:tier/views/perfil_pages/meu_perfil.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';
import 'package:tier/widgets/auth_widgets/recuperar_senha.dart';
import 'package:tier/widgets/auth_widgets/login_page.dart';
import 'package:tier/views/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  String? _errorText;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  String? TextErrorEmpty(String? Text) {
    String? TextError;
    if (Text == 'error-E') {
      TextError = "Preencha todos os campos";
    } else {
      TextError = null;
    }
    return TextError;
  }

  String? TextErrorPassword(String? Text) {
    String? TextError;
    if (Text == 'error-P') {
      TextError = "Senhas não coincidem";
    } else if (Text == 'error-E') {
      TextError = "Preencha todos os campos";
    } else {
      TextError = null;
    }
    return TextError;
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String? resultSup = await AuthMethod().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      passwordConfirm: _passwordConfirmController.text,
      username: _usernameController.text,
    );
    String? resultSin = await AuthMethod().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (resultSup == 'success') {
      _emailController.text = '';
      _usernameController.text = '';
      _passwordController.text = '';
      _passwordConfirmController.text = '';

      setState(() {
        _errorText = resultSup;
      });
    } else {
      _errorText = resultSup;
    }
  }

  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cinzaBranco,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Cadastro',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: AppColor.amareloPrincipal,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 6,
                  child: FloatingActionButton.extended(
                    label: Image(
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width / 7,
                      image: AssetImage('images/google_icon.png'),
                    ),
                    onPressed: () {},
                    backgroundColor: AppColor.textoBranco,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 6,
                  child: FloatingActionButton.extended(
                    label: Icon(
                      Icons.facebook,
                      color: Color(0xFF1877F2),
                      size: MediaQuery.of(context).size.height / 17,
                    ),
                    onPressed: () {},
                    backgroundColor: AppColor.textoBranco,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(
                        fontSize: 20, color: AppColor.cinzaclaroAppBar),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                        fontSize: 20, color: AppColor.cinzaclaroAppBar),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText: TextErrorPassword(_errorText),
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                        fontSize: 20, color: AppColor.cinzaclaroAppBar),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                child: TextField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText: TextErrorPassword(_errorText),
                    labelText: 'Confirmar senha',
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
              height: MediaQuery.of(context).size.height / 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width / 1.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)),
                  primary: AppColor.amareloEscuro,
                ),
                onPressed: signUpUser,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColor.textoBranco,
                        ),
                      )
                    : Text(
                        "Cadastrar",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: AppColor.textoBranco,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
          ],
        ),
      ),
    );
  }
}
