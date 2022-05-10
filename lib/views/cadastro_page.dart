import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tier/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cinzaBranco,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: AppColor.textoBranco,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textosPretos3,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textosPretos3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 46.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFFFFFFF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: TextField(
                            onChanged: (text) {
                              email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.cinzaclaroAppBar),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFFFFFFF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: TextField(
                            onChanged: (text) {
                              senha = text;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.cinzaclaroAppBar),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: AppColor.amareloPrincipal,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: AppColor.amareloPrincipal,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          onPressed: () {
                            if (email == 'admin' && senha == 'admin') {
                              print('logou');
                            } else {
                              print('login invalido');
                            }
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          color: AppColor.amareloPrincipal,
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: Text(
                          'Ou',
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColor.textosPretos3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          onPressed: () {
                            if (email == 'admin' && senha == 'admin') {
                              print('logou');
                            } else {
                              print('login invalido');
                            }
                          },
                          child: Text(
                            'Entrar com o Facebook',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          color: Color(0xbb0000ff),
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          onPressed: () {
                            if (email == 'admin' && senha == 'admin') {
                              print('logou');
                            } else {
                              print('login invalido');
                            }
                          },
                          child: Text(
                            'Entrar com o Google',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          color: Colors.white,
                          textColor: Color(0xbb000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
