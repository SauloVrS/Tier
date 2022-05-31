
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/models/users_model.dart';
import 'package:tier/views/chat/chatmodels/messages.dart';
import 'package:tier/views/chat/chatmodels/user.dart';
import 'package:tier/views/chat/screens/chat_screen.dart';
import 'package:tier/views/pet_page.dart';

import '../data/animais_fav.dart';
import '../models/pet_model.dart';
import '../widgets/animais_dono_list.dart';
import '../widgets/animais_fav_list.dart';

class PerfilDonoPet extends StatefulWidget {
  final ModelUsers user;
  final String idUsuario;
  const PerfilDonoPet({Key? key, required this.user, required this.idUsuario}) : super(key: key,);

  @override
  State<PerfilDonoPet> createState() => _PerfilDonoPetState();
}

class _PerfilDonoPetState extends State<PerfilDonoPet> {
  List<Map> favoritas = [];

  initData(){
    favoritas = AnimaisFav().animaisFavoritos;
  }
  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = chats[0].sender;
    return Scaffold(
      backgroundColor: Color(0xEFECECD5),
      body: Stack(
        children: [
          //foto e nome
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.width/1.5,
                color: AppColor.cinzaClaro.withOpacity(0.1),
                child: Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width/8),
                  child: Column(
                    children: [
                      Container(

                        width: MediaQuery.of(context).size.width/3.5,
                        height: MediaQuery.of(context).size.width/3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://th.bing.com/th/id/OIP.ri6Xe7lAc79oh4m-5mNs-gHaEK?pid=ImgDet&rs=1')
                          )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/80),
                      Text("Victor Rangel",style: GoogleFonts.poppins(fontSize:MediaQuery.of(context).size.width/22, fontWeight: FontWeight.w500  ),)
                    ],
                  ),
                ),
          )
          ),
          //button to back
          Positioned(
              top: 45,
              left: 20,
              right: 330,
              child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 20,)

          ),
          //informacoes
          Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height/3.8,
              bottom: 0,
              child:
             Container(
               padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/15,right: MediaQuery.of(context).size.width/15, top: MediaQuery.of(context).size.height/25,bottom: MediaQuery.of(context).size.height/40),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only( topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                 color: AppColor.background,
               ),
               child: Column(
                 children: [
                   Text("Sou uma pessoa que legal que luta pela causa animal e blablabla",style: GoogleFonts.poppins(),),
                   SizedBox( height: MediaQuery.of(context).size.height/30),
                   Container(
                     width: MediaQuery.of(context).size.width/1.32,
                     height: MediaQuery.of(context).size.height/15,
                     padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/40,right: MediaQuery.of(context).size.width/40, top: MediaQuery.of(context).size.height/70,bottom: MediaQuery.of(context).size.height/70),
                     decoration: BoxDecoration(
                       color: AppColor.amareloPrincipal,
                       borderRadius: BorderRadius.all(Radius.circular(15)),

                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text("Mandar mensagem",style: GoogleFonts.poppins(color: AppColor.textoBranco,fontSize: 16),),
                         IconButton(
                           onPressed: 
                            () => Navigator.push(context, 
                                  MaterialPageRoute(
                                    
                                     builder: (_) => ChatScreen(
                                       user: user,
                                    ),
                                  )
                            ), 
                           icon: const Icon(Icons.chat_bubble_rounded),
                           iconSize: 18,
                           color: AppColor.textoBranco
                           )
                       ],
                     ),
                   ),
                   SizedBox( height: MediaQuery.of(context).size.height/30),
                   Text("Animais para adoção",textAlign: TextAlign.left,style: GoogleFonts.poppins(fontSize: 18,color: AppColor.textosPretos3)),

                   Expanded(
                     child: ListView.builder(
                       itemCount: (favoritas.length%2 == 0)? (favoritas.length)~/2: (favoritas.length)~/2 + 1,
                       itemBuilder: (context, index){
                         int a = 2 * index;
                         int b = a + 1;
                         return Row(
                           children: [
                             AnimaisDonoList(
                                 nome: favoritas[a]['nome_pet'],
                                 imgUrl: favoritas[a]['foto_pet'],
                                 idade: favoritas[a]['idade'],
                                 direita: 0,
                                 esquerda: 0),
                             (b <= favoritas.length - 1)?
                             AnimaisDonoList(
                                 nome: favoritas[b]['nome_pet'],
                                 imgUrl: favoritas[b]['foto_pet'],
                                 idade: favoritas[b]['idade'],
                                 direita: 0,
                                 esquerda: 0):
                             Container(),
                           ],
                         );
                       },
                     ),
                   ),





                 ],
               ),

          ))
        ],
      ),
    );
  }
}
