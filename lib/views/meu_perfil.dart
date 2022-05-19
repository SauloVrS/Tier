import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfil/colors.dart';
import 'package:perfil/data/meus_animais.dart';
import 'package:perfil/meu_perfil_pages/adicionar_pet.dart';
import 'package:perfil/perfil_usuario.dart';
import 'package:perfil/widgets/meus_animais_list.dart';
import 'widgets/bottom_nav_bar.dart';

class MeuPerfil extends StatefulWidget {
  const MeuPerfil({Key? key}) : super(key: key);

  @override
  _MeuPerfilState createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {
  List<Map> pets = [];

  initData(){
    pets = MeusPets().meusPets;
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(0.95),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(
              child: Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 100)/2,
                    height: 110,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) => TelaPerfilUsuario(),//COLOCAR O CENTER SE NÃO TIVER ESSA PAGINA NO SEU ARQUIVO
                                      )
                                  );
                                },
                                icon: Icon(Icons.arrow_back_ios_outlined),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              color: AppColor.cinzaClaro.withOpacity(0.6),
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(-1, -1),
                              color: AppColor.cinzaClaro.withOpacity(0.6),
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(-1, 1),
                              color: AppColor.cinzaClaro.withOpacity(0.6),
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, -1),
                              color: AppColor.cinzaClaro.withOpacity(0.6),
                            ),
                          ],
                        ),
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.ri6Xe7lAc79oh4m-5mNs-gHaEK?pid=ImgDet&rs=1'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 100)/2,
                    height: 110,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container()),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.mode_edit_outlined),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Vitor Rangel',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.textosPretos2,
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: AppColor.background,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        height: 80,
                        child: Text(
                          'descrição pika do vitor que não tem cara de vitor, seria melhor: \nVETOR! AH EHH!',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                        ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                              builder: (context) => AdicionarPet(),//COLOCAR O CENTER SE NÃO TIVER ESSA PAGINA NO SEU ARQUIVO
                            )
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        width: MediaQuery.of(context).size.width - 80,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.amareloPrincipal,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Adicionar novo Animal',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textoBranco,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        'Animais para adoção',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textosPretos2,
                        ),

                      ),
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                        child: (pets.isEmpty)?
                        Row(
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
                                              "assets/img_2.png"
                                          )
                                      )
                                  ),
                                ),
                                Text(
                                  'Não há animais para adoção',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 15,),
                              ],
                            ),
                          ],
                        ):
                        ListView.builder(
                          itemCount: (pets.length%2 == 0)? ((pets.length)/2).toInt(): ((pets.length)/2).toInt() + 1,
                          itemBuilder: (context, index){
                            int a = 2 * index;
                            int b = a + 1;
                            return Row(
                              children: [
                                MeusAnimaisList(
                                    nome: pets[a]['nomePet'],
                                    imgUrl: pets[a]['fotoPet'],
                                    idade: pets[a]['idadePet'],
                                    direita: 10,
                                    esquerda: 15),
                                (b <= pets.length - 1)?
                                MeusAnimaisList(
                                    nome: pets[b]['nomePet'],
                                    imgUrl: pets[b]['fotoPet'],
                                    idade: pets[b]['idadePet'],
                                    direita: 15,
                                    esquerda: 10):
                                Container(),
                              ],
                            );
                          },
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
