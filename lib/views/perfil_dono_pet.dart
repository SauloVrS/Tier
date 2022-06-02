
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/models/users_model.dart';
import 'package:tier/views/adocao-home.dart';
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
                            image: NetworkImage(widget.user.fotoUsuario!)
                          )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/80),
                      Text(widget.user.nomeUsuario!,style: GoogleFonts.poppins(fontSize:MediaQuery.of(context).size.width/22, fontWeight: FontWeight.w500  ),)
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
              child: GestureDetector(
                onTap: () =>
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            AdocaoHome())),
                child: Container(

                    child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 20,)),
              )

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
                   Text(widget.user.descricaoUsuario!,style: GoogleFonts.poppins(),),
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
                                        friendUid: "h6djybClDTYhhsq3aYkL",friendName: "leticia",
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
                       child: StreamBuilder<List<ModelPet>>(
                         stream: readPetsDono('yE7Al0eRAnc59JdjfrNh'),
                         builder: (context, snapshot){
                           if (snapshot.hasError){
                             return Text('Something went wrong 1! ${snapshot.error}');
                           }
                           else if (snapshot.hasData){
                             final petsDono = snapshot.data;
                             if (petsDono!.isEmpty) {
                               return Center();
                             } else {
                               return ListView.builder(
                                   itemCount: (petsDono.length%2 == 0)? ((petsDono.length)/2).toInt(): ((petsDono.length)/2).toInt() + 1,
                                   itemBuilder: (context, index) {
                                     int a = 2 * index;
                                     int b = a + 1;
                                     return Row(
                                       children: [
                                         AnimaisDonoList(
                                                   nome: petsDono[a].nomePet,
                                                   imgUrl: petsDono[a].fotoPet,
                                                   idade: petsDono[a].idadePet,
                                                   direita: 0,
                                                   esquerda: 0,
                                                   idUser: widget.user.idUsuario!,

                                               ),
                                         (b <= petsDono.length - 1)?
                                          AnimaisDonoList(
                                                 nome: petsDono[b].nomePet,
                                                 imgUrl: petsDono[b].fotoPet,
                                                 idade: petsDono[b].idadePet,
                                                 direita: 0,
                                                 esquerda: 0,
                                                 idUser: widget.user.idUsuario!,
                                               ): Container()
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

          ))
        ],
      ),
    );
  }
}
