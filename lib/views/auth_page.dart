import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/widgets/auth_widgets/cadastro_page.dart';
import 'package:tier/widgets/auth_widgets/login_page.dart';

class authPage extends StatefulWidget {
  const authPage({Key? key}) : super(key: key);

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.cinzaBranco,
        appBar: AppBar(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          toolbarHeight: MediaQuery.of(context).size.height / 4,
          centerTitle: true,
          title: const Center(
            child: Image(
              image: AssetImage("images/img.png"),
            ),
          ),
          backgroundColor: AppColor.textoBranco,
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
                borderSide:
                    BorderSide(width: 4.0, color: AppColor.amareloPrincipal),
                insets: EdgeInsets.symmetric(horizontal: 30.0)),
            tabs: [
              Tab(
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColor.textosPretos3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Cadastre-se',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColor.textosPretos3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: LoginPage(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: CadastroPage(),
            ),
          ],
        ),
      ));
}
