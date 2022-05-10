import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';
import 'package:tier/views/configuracoes_perfil.dart';


class TelaPerfilUsuario extends StatefulWidget {
  const TelaPerfilUsuario({Key? key}) : super(key: key);

  @override
  _TelaPerfilUsuarioState createState() => _TelaPerfilUsuarioState();
}

class _TelaPerfilUsuarioState extends State<TelaPerfilUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              //color: Colors.amber.withOpacity(0.4),
              margin: const EdgeInsets.only(top: 25, bottom: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          //color: Colors.blue,
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
                        child: CircleAvatar(
                          backgroundColor: AppColor.background,
                          foregroundColor: AppColor.textosPretos2,
                          child: Icon(Icons.perm_identity), //trocar firebase
                          //imagem: colocar background imagem no lugar de child
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width - 125,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Nome', //firebase aqui
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 60)/2,
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
                              ]
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Icon(Icons.receipt_long_outlined,
                                  color: AppColor.textosPretos3,
                              ),
                              const SizedBox(width: 10,),
                              RichText(text: TextSpan(
                                  text: 'Meus\n',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: AppColor.textosPretos3),
                                  children: const [
                                    TextSpan(
                                      text: 'pedidos',
                                    )
                                  ]
                              ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 60)/2,
                          height: 110,
                          padding: EdgeInsets.all(30),
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
                              ]                           ),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.rosette,
                                color: AppColor.textosPretos3,
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                'Nível',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: AppColor.textosPretos3,
                                ),
                              )
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
              onTap: (){},
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
                          const SizedBox(width: 15,),
                          Icon(Icons.perm_identity,
                            color: AppColor.textosPretos3,
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Meu Perfil',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(width: 15,),
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
              onTap: (){},
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(width: 15,),
                          Icon(Icons.local_activity_outlined,
                            color: AppColor.textosPretos3,
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Cupons',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(width: 15,),
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
              onTap: (){},
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(width: 15,),
                          Icon(Icons.account_balance_wallet_outlined,
                            color: AppColor.textosPretos3,
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Carteira',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(width: 15,),
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
              onTap: (){},
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(width: 15,),
                          Icon(Icons.wallet_giftcard_outlined,
                            color: AppColor.textosPretos2,
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Assinatura',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(width: 15,),
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
              onTap: (){},
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(width: 15,),
                          Icon(Icons.location_on_outlined,
                            color: AppColor.textosPretos3,
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Endereços',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(width: 15,),
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
              onTap: (){},
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(width: 15,),
                          Icon(Icons.share,
                            color: AppColor.textosPretos2,
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Meu código',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(width: 15,),
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Configuracoes()));
              },
              child: Container(
                height: 59,
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      child: Row(
                        children: [
                          const SizedBox(width: 15,),
                          Icon(Icons.settings_outlined,
                            color: AppColor.textosPretos3,
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Configurações',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: AppColor.textosPretos3,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,
                            color: AppColor.textosPretos2.withOpacity(0.8),
                          ),
                          const SizedBox(width: 15,),
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
      bottomNavigationBar: const BottomNavBar(pagina: 'perfil'),
    );
  }
}
