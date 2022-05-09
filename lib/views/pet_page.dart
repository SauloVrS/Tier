import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                height: 350,

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
              top: 320,
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
                            Text("Bolinha",style: TextStyle(fontSize: 38,fontWeight: FontWeight.w700),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.place_outlined,size: 18,),
                                SizedBox(width: 4,),
                                Text("1,7km",style: TextStyle(fontSize: 16),)
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 6,right: 6,bottom: 6,top: 6),
                          child: Icon( Icons.star_outline,size: 32, ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),

                          ),
                        )
                      ],
                    ) ,
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.only(left: 4,right: 4,bottom: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 16,bottom: 16,left: 16,right: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFFffb761),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,bottom: 5,right: 10,top: 5),
                              child: Column(

                                children: [
                                  Text("Macho",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                  Text("Gênero",style: TextStyle(fontSize: 15),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Container(
                            padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFFffb761),
                            ),
                            child: Column(

                              children: [
                                Text("2 Meses",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                Text("Idade",style: TextStyle(fontSize: 15),)
                              ],
                            ),
                          ),
                          SizedBox(width: 12,),
                          Container(
                            padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFFffb761),
                            ),
                            child: Column(

                              children: [
                                Text("Pequeno",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                Text("Porte",style: TextStyle(fontSize: 15),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //informacoes do dono
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          Container(
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
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              Text("Vitor Rangel",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                              Text("Doador",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),),

                            ],
                          ),
                          SizedBox(width: 70,),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                            decoration: BoxDecoration(
                                color: Color(0xFFc4c4c4),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("Ver perfil",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          )
                        ],
                      ),
                    ),

                    //descricao do dono
                    Padding(
                      padding: const EdgeInsets.only(left: 11,right: 11,top: 11,bottom: 0),
                      child: Text("Tive muitos filhotes e só posso cuidar de 1"),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Row(
                          children: [
                            Text("Descrição do gato: calmo, pequeno..."),
                            SizedBox(width: 10,),
                            Text("Mostrar mais",style: TextStyle(color: Colors.orangeAccent),),
                          ],

                        )
                    ),
                    SizedBox(height: 30,),
                    //botao de adotar
                    Container(
                      padding: EdgeInsets.only(top: 20,bottom: 20,left: 60,right: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFffb761),
                      ),
                      child: Text("Adotar",style: TextStyle(fontSize: 18),),
                    ),
                    SizedBox(height: 38,)
                  ],


                ),
              ))
        ],
      ),
    );
  }
}

