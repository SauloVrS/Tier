import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/auth_page.dart';
import 'package:tier/views/perfil_pages/cupom_perfil.dart';
import 'package:tier/views/perfil_pages/meu_codigo_perfil.dart';
import 'package:tier/widgets/perfil_pages/editar_meu_perfil.dart';

import '../../colors.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tier/colors.dart';
import 'package:tier/models/users_model.dart';
import 'package:tier/views/perfil_pages/meu_perfil.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';
import 'package:tier/views/perfil_pages/configuracoes_perfil.dart';
import 'nivel_usuario.dart';

class TelaPerfilUsuario extends StatefulWidget {
  const TelaPerfilUsuario({Key? key}) : super(key: key);

  @override
  _TelaPerfilUsuarioState createState() => _TelaPerfilUsuarioState();
}

class _TelaPerfilUsuarioState extends State<TelaPerfilUsuario> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                margin: const EdgeInsets.only(
                    top: 10, bottom: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(5, 5),
                                color: AppColor.cinzaBranco,
                              ),
                              BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(-5, -5),
                                color: AppColor.cinzaBranco,
                              ),
                              BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(-5, 5),
                                color: AppColor.cinzaBranco,
                              ),
                              BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(5, -5),
                                color: AppColor.cinzaBranco,
                              ),
                            ],
                          ),
                          child: (idUsuario == null)
                              ? CircleAvatar(
                                  backgroundColor: AppColor.background,
                                  foregroundColor: AppColor.textosPretos2,
                                  child: Icon(Icons.perm_identity),
                                )
                              : FutureBuilder<ModelUsers?>(
                                  future: readUser(idUsuario!),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      print(snapshot.error);
                                      return Text(
                                          'Something went wrong! ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      final user = snapshot.data;
                                      return (user!.fotoUsuario == null)
                                          ? CircleAvatar(
                                              backgroundColor:
                                                  AppColor.background,
                                              foregroundColor:
                                                  AppColor.textosPretos2,
                                              child: Icon(Icons.perm_identity),
                                            )
                                          : CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  user.fotoUsuario!),
                                            );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width - 125,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: (idUsuario == null)
                              ? Text(
                                  'Nome',
                                  style: GoogleFonts.poppins(fontSize: 20),
                                )
                              : FutureBuilder<ModelUsers?>(
                                  future: readUser(idUsuario!),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      print(snapshot.error);
                                      return Text(
                                          'Something went wrong! ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      final user = snapshot.data;
                                      return Text(
                                        user!.nomeUsuario!,
                                        style:
                                            GoogleFonts.poppins(fontSize: 20),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            height: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.background,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(3, 3),
                                    color: AppColor.cinzaBranco,
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(-3, -3),
                                    color: AppColor.cinzaBranco,
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(-3, 3),
                                    color: AppColor.cinzaBranco,
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(3, -3),
                                    color: AppColor.cinzaBranco,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.receipt_long_outlined,
                                      color: AppColor.textosPretos3,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: 'Meus\n',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: AppColor.textosPretos3),
                                          children: const [
                                            TextSpan(
                                              text: 'pedidos',
                                            )
                                          ]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NivelUsuario(),
                                ));
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            height: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.background,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(3, 3),
                                    color: AppColor.cinzaBranco,
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(-3, -3),
                                    color: AppColor.cinzaBranco,
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(-3, 3),
                                    color: AppColor.cinzaBranco,
                                  ),
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(3, -3),
                                    color: AppColor.cinzaBranco,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.rosette,
                                      color: AppColor.textosPretos3,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Nível',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: AppColor.textosPretos3,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (idUsuario == null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              authPage(), //COLOCAR O CENTER SE NÃO TIVER ESSA PAGINA NO SEU ARQUIVO
                        ));
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MeuPerfil(), //COLOCAR O CENTER SE NÃO TIVER ESSA PAGINA NO SEU ARQUIVO
                        ));
                  }
                },
                child: Container(
                  height: 60,
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        color: AppColor.cinzaClaro.withOpacity(0.6),
                      ),
                      Container(
                        height: 58,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.perm_identity,
                              color: AppColor.textosPretos3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Meu Perfil',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: AppColor.textosPretos3,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.textosPretos2.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: AppColor.cinzaClaro.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Cupons()));
                },
                child: Container(
                  height: 59,
                  child: Column(
                    children: [
                      Container(
                        height: 58,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.local_activity_outlined,
                              color: AppColor.textosPretos3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Cupons',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: AppColor.textosPretos3,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.textosPretos2.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: AppColor.cinzaClaro.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 59,
                  child: Column(
                    children: [
                      Container(
                        height: 58,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.account_balance_wallet_outlined,
                              color: AppColor.textosPretos3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Carteira',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: AppColor.textosPretos3,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.textosPretos2.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: AppColor.cinzaClaro.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 59,
                  child: Column(
                    children: [
                      Container(
                        height: 58,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.wallet_giftcard_outlined,
                              color: AppColor.textosPretos2,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Assinatura',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: AppColor.textosPretos3,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.textosPretos2.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: AppColor.cinzaClaro.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 59,
                  child: Column(
                    children: [
                      Container(
                        height: 58,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColor.textosPretos3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Endereços',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: AppColor.textosPretos3,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.textosPretos2.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: AppColor.cinzaClaro.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Meu_cupom()));
                },
                child: Container(
                  height: 59,
                  child: Column(
                    children: [
                      Container(
                        height: 58,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.share,
                              color: AppColor.textosPretos2,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Meu código',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: AppColor.textosPretos3,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.textosPretos2.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: AppColor.cinzaClaro.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Configuracoes()));
                },
                child: Container(
                  height: 59,
                  child: Column(
                    children: [
                      Container(
                        height: 58,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.settings_outlined,
                              color: AppColor.textosPretos3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Configurações',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: AppColor.textosPretos3,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.textosPretos2.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: AppColor.cinzaClaro.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'perfil'),
    );
  }
}
