import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/perfil_dono_pet.dart';

import 'adocao-home.dart';


class PetPage extends StatefulWidget {


  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xEFECECD5),
      body: Stack(
        children: [
          //image
          Positioned(
              left: 0,
              right: 0,
              child: Container(

                width: double.maxFinite,
                height: MediaQuery.of(context).size.width/1.8,

                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://th.bing.com/th/id/OIP.px4Qpdbci1QQaxN7gm_jLAHaEN?pid=ImgDet&rs=1'
                        )
                    )
                ),
              )),
          //button to back
          Positioned(
              top: 45,
              left: 20,
              right: 330,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder: (context) => AdocaoHome()));
                },

                child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 20,),
              )
          ),
          //information
          Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height/4.2,
              child: Container(
                padding: EdgeInsets.only(left: 18, right: 18, top: 18,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xEFECECD5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Bolinha",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/13,fontWeight: FontWeight.w700),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.place_outlined,size: 18,),
                                SizedBox(width: 4,),
                                Text("1,7km",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/23),)
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 6,right: 6,bottom: 6,top: 6),
                          child: Icon( Icons.star_outline,size: MediaQuery.of(context).size.width/11,color: Colors.amber, ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),

                          ),
                        )
                      ],
                    ) ,
                    SizedBox(height: MediaQuery.of(context).size.width/18,),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,bottom: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/40,bottom: MediaQuery.of(context).size.width/40,left: MediaQuery.of(context).size.width/40,right: MediaQuery.of(context).size.width/40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/15),
                              color: Color(0xFFffb761),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4,bottom: 4,right: 10,top: 4),
                              child: Column(

                                children: [
                                  Text("Macho",style: GoogleFonts.poppins(fontSize:MediaQuery.of(context).size.width/25,fontWeight: FontWeight.w600),),
                                  Text("Gênero",style: GoogleFonts.poppins(fontSize:MediaQuery.of(context).size.width/30),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/22,),
                          Container(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30,bottom: MediaQuery.of(context).size.width/30,left: MediaQuery.of(context).size.width/30,right: MediaQuery.of(context).size.width/30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/15),
                              color: Color(0xFFffb761),
                            ),
                            child: Column(

                              children: [
                                Text("2 Meses",style: GoogleFonts.poppins(fontSize:MediaQuery.of(context).size.width/23,fontWeight: FontWeight.w600),),
                                Text("Idade",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/28),)
                              ],
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/22,),
                          Container(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30,bottom: MediaQuery.of(context).size.width/30,left: MediaQuery.of(context).size.width/30,right: MediaQuery.of(context).size.width/30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/15),
                              color: Color(0xFFffb761),
                            ),
                            child: Column(

                              children: [
                                Text("Pequeno",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/23,fontWeight: FontWeight.w600),),
                                Text("Porte",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/28),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //informacoes do dono
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/40,bottom: MediaQuery.of(context).size.width/40,left: MediaQuery.of(context).size.width/40,right: MediaQuery.of(context).size.width/40),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/5,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100) ,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://th.bing.com/th/id/OIP.ri6Xe7lAc79oh4m-5mNs-gHaEK?pid=ImgDet&rs=1'
                                    )
                                )
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/35,),
                          Column(
                            children: [
                              Text("Vitor Rangel",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/25,fontWeight: FontWeight.w600),),
                              Text("Doador",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/33,fontWeight: FontWeight.w400),),

                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/8,),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                            decoration: BoxDecoration(
                                color: Color(0xFFc4c4c4),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) =>  PerfilDonoPet(),
                                      )
                                  );
                                },
                                child: Text("Ver perfil",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/30,fontWeight: FontWeight.w500),)),
                          )
                        ],
                      ),
                    ),

                    //descricao do dono
                    Padding(
                      padding: const EdgeInsets.only(left: 11,right: 11,top: 11,bottom: 0),
                      child: Text("Tive muitos filhotes e só posso cuidar de 1",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/30),),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Row(
                          children: [
                            Text("Descrição do gato: calmo, pequeno...",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/32)),

                            SizedBox(width: 10,),
                            Text("Mostrar mais",style: GoogleFonts.poppins(color: Colors.orangeAccent,fontSize: MediaQuery.of(context).size.width/46),),
                          ],

                        )
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/60,),
                    //botao de adotar
                    Container(
                      padding: EdgeInsets.only(top: 5,bottom: 5,left: 30,right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFffb761),
                      ),
                      child: Text("Adotar",style: GoogleFonts.poppins(fontSize:MediaQuery.of(context).size.width/20 ),),
                    ),
                    SizedBox(height: 500,)
                  ],


                ),
              ))
        ],
      ),
    );
  }
}



