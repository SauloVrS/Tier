import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/models/pet_model.dart';
import 'package:tier/models/users_model.dart';
import 'package:tier/views/pet_pages/adocao-home.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';
import '../colors.dart';
import '../widgets/animais_fav_list.dart';
import '../widgets/bottom_nav_bar.dart';
import 'fav_lojas.dart';


class FavAnimais extends StatefulWidget {
  const FavAnimais({Key? key}) : super(key: key);

  @override
  _FavAnimaisState createState() => _FavAnimaisState();
}

class _FavAnimaisState extends State<FavAnimais> {
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
                        onTap: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                builder: (context) => const FavLojas2(),
                              )
                          );
                        },//width: MediaQuery.of(context).size.width/2
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
                      color: AppColor.cinzaClaro,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 2,
                      color: AppColor.background,
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
                                  "images/img_fav_animais.png"
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
                              builder: (context) => AdocaoHome(),//COLOCAR MAIN AQUI QUANDO COLOCAR NO OUTRO ARQUIVO
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
                                  'Ir para Animais',
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
            :StreamBuilder<List<ModelFavoritosAnimais>>(
              stream: readFavoritosAnimais(idUsuario!),
              builder: (context, snapshot){
                if (snapshot.hasError){
                  return Text('Something went wrong! ${snapshot.error}');
                }
                else if (snapshot.hasData){
                  final favoritas = snapshot.data;
                  if (favoritas!.isEmpty) {
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
                                          "images/img_fav_animais.png"
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
                                      builder: (context) => AdocaoHome(),//COLOCAR MAIN AQUI QUANDO COLOCAR NO OUTRO ARQUIVO
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
                                          'Ir para Animais',
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
                  } else {
                    return ListView.builder(
                        itemCount: (favoritas.length%2 == 0)? ((favoritas.length)/2).toInt(): ((favoritas.length)/2).toInt() + 1,
                        itemBuilder: (context, index) {
                          int a = 2 * index;
                          int b = a + 1;
                          return Row(
                            children: [
                              FutureBuilder<ModelPet?>(
                                future: readPet(favoritas[a].idPet),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError){
                                    return Text('Something went wrong! ${snapshot.error}');
                                  } else if (snapshot.hasData){
                                    final pet = snapshot.data;
                                    return AnimaisList(
                                      nome: pet!.nomePet,
                                      imgUrl: pet.fotoPet,
                                      idade: pet.idadePet,
                                      direita: 10,
                                      esquerda: 15,
                                      idFav: favoritas[a].idFav,
                                      idUser: idUsuario,
                                    );
                                  } else{
                                    return const Center(child: CircularProgressIndicator(),);
                                  }
                                },
                              ),
                              (b <= favoritas.length - 1)?
                              FutureBuilder<ModelPet?>(
                                future: readPet(favoritas[b].idPet),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError){
                                    return Text('Something went wrong! ${snapshot.error}');
                                  } else if (snapshot.hasData){
                                    final pet = snapshot.data;
                                    return AnimaisList(
                                      nome: pet!.nomePet,
                                      imgUrl: pet.fotoPet,
                                      idade: pet.idadePet,
                                      direita: 15,
                                      esquerda: 10,
                                      idFav: favoritas[a].idFav,
                                      idUser: idUsuario,
                                    );
                                  } else{
                                    return const Center(child: CircularProgressIndicator(),);
                                  }
                                },
                              ):
                              Container(),
                            ],
                          );
                        }
                    );
                  }
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }
              },
            )
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'fav'),
    );
  }
}
