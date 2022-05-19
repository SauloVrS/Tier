import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/data/pet_data.dart';

import '../views/pet_page.dart';


class PetList extends StatefulWidget {
  final String foto_pet, nome_pet, genero,idade,distancia,typePet;
  //final String favorite;

  PetList({Key? key, required this.foto_pet, required this.nome_pet,required this.genero,
    required this.idade, required this.distancia, required this.typePet
  }) : super(key: key);




  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  List<Map>pets=[];



  initData(){
    pets = Pets().pets;
  }

  @override
  void initState(){
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                  builder: (context) =>  PetPage(),
                  )
              );
            },
            child: Container(
                width: MediaQuery.of(context).size.width/1.2,
                height: MediaQuery.of(context).size.height/3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.foto_pet)),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 10, top: 4, right: 10, bottom: 3.8),
            width: MediaQuery.of(context).size.width/1.2,
            height: MediaQuery.of(context).size.height/9,
            decoration: BoxDecoration(
              color: Color(0xffe5e5e5),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
            ),
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(widget.nome_pet, style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width/15,
                            fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/15,),
                        Text(widget.idade,
                          style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/22),),
                        Text(widget.typePet,style: GoogleFonts.poppins(fontSize: 0.1),)



                      ],

                    ),
                    Container(
                      padding: EdgeInsets.only(left:1,
                          right: 1,
                          bottom: 1,
                          top: 1),
                      child: Icon(
                        Icons.star_outline, size: MediaQuery.of(context).size.width/12,color: Colors.amber,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            30),

                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                Row(
                  children: [
                    Icon(Icons.place_outlined, size: MediaQuery.of(context).size.height/28,),
                    SizedBox(width: 4,),
                    Text(widget.distancia,
                      style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.width/23),)
                  ],
                )
              ],
            ),
          )

        ],
      ),

    );
  }
}