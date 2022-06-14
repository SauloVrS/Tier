import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/firebase/loja_helper.dart';
import 'package:tier/models/users_model.dart';
import 'package:tier/views/main_lojas.dart';
import '../colors.dart';
import '../data/lojas_fav.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/lojas_list.dart';
import 'fav_animais.dart';

class FavLojas2 extends StatefulWidget {
  const FavLojas2({Key? key}) : super(key: key);

  @override
  _FavLojas2State createState() => _FavLojas2State();
}

class _FavLojas2State extends State<FavLojas2> {
  List<Map> favoritas = [];
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        shadowColor: AppColor.background,
        elevation: 0.2,
        title: Text(
          'Favoritos',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: AppColor.textosPretos3,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColor.background,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.cinzaBranco.withOpacity(0.6),
                    offset: const Offset(0, 4),
                    blurRadius: 0.8,
                  )
                ]
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                builder: (context) => const FavAnimais(),
                              )
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Animais',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: AppColor.textosPretos3,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},//width: MediaQuery.of(context).size.width/2
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Lojas',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: AppColor.textosPretos3,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 2,
                      color: AppColor.background,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 2,
                      color: AppColor.cinzaClaro,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: (idUsuario == null)
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "images/img_fav_lojas.png"
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      'Você ainda não tem favoritos...',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Descubra seu novo\n',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppColor.textosPretos3),
                          children: const [
                            TextSpan(
                              text: 'queridinho agora mesmo',
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                              builder: (context) => const MainLojas(),
                            )
                        );
                      },
                      child: Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColor.amareloPrincipal.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.cinzaBranco,
                                blurRadius: 0.8,
                                offset: const Offset(2, 2),
                              ),
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Ir para Lojas',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.textoBranco,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
                :StreamBuilder<List<ModelFavoritosLojas>>(
                 stream: readFavoritosLojas(idUsuario!),
                  builder: (context, snapshot){
                  if (snapshot.hasError){
                    return Text('Something went wrong! ${snapshot.error}');
                  }else if (snapshot.hasData){
                    final favoritas = snapshot.data;
                    if (favoritas!.isEmpty){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "images/img_fav_lojas.png"
                                        )
                                    )
                                ),
                              ),
                              const SizedBox(height: 15,),
                              Text(
                                'Você ainda não tem favoritos...',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Descubra seu novo\n',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: AppColor.textosPretos3),
                                    children: const [
                                      TextSpan(
                                        text: 'queridinho agora mesmo',
                                      )
                                    ]
                                ),
                              ),
                              const SizedBox(height: 10,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) => const MainLojas(),
                                      )
                                  );
                                },
                                child: Container(
                                  width: 180,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: AppColor.amareloPrincipal.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.cinzaBranco,
                                          blurRadius: 0.8,
                                          offset: const Offset(2, 2),
                                        ),
                                      ]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Ir para Lojas',
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.textoBranco,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }
                    else {
                      return ListView.builder(
                        itemCount: favoritas.length,
                        itemBuilder: (context, index){
                          return FutureBuilder<Loja?>(
                              future: readLoja(favoritas[index].idLoja),
                              builder: (context, snapshot){
                                if (snapshot.hasError){
                                  return Text('Something went wrong! ${snapshot.error}');
                                } else if (snapshot.hasData){
                                  final lojas = snapshot.data;
                                  return Row(
                                    children: [
                                      lojaList(lojas!, 70, context),
                                      GestureDetector(
                                        onTap: (){},
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(60),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColor.cinzaBranco,
                                                  blurRadius: 0.9,
                                                  offset: const Offset(1, 1),
                                                ),
                                                BoxShadow(
                                                  color: AppColor.cinzaBranco,
                                                  blurRadius: 0.9,
                                                  offset: const Offset(-1, 1),
                                                ),
                                              ]
                                          ),
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                    ],
                                  );
                                } else{
                                  return const Center(child: CircularProgressIndicator(),);
                                }
                              }
                          );
                        },
                      );
                    }
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'fav'),
    );
  }
}
