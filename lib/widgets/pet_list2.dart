import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/pet_page.dart';

class ListarPet extends StatefulWidget {
  const ListarPet({Key? key}) : super(key: key);

  @override
  State<ListarPet> createState() => _ListarPetState();
}

class _ListarPetState extends State<ListarPet> {
  String descricaoPet = "";
  String distancia = "";
  String fotoPet = "";
  String generoPet = "";
  String idadePet = "";
  String nomePet = "";
  String typePet = "";

  @override
  void initState() {
    super.initState();
    getPet();
  }
  void getPet() async{
   DocumentSnapshot snap= await FirebaseFirestore.instance
       .collection('usuarios')
       .doc(FirebaseAuth.instance.currentUser!.uid)
       .collection('pets')
       .doc(FirebaseAuth.instance.currentUser!.uid)
       .get();
   setState(() {
    descricaoPet = (snap.data() as Map<String, dynamic>)['descricaoPet'];
    distancia = (snap.data() as Map<String, dynamic>)['distanciaPet'];
    fotoPet = (snap.data() as Map<String, dynamic>)['fotoPet'];
    generoPet = (snap.data() as Map<String, dynamic>)['generoPet'];
    idadePet = (snap.data() as Map<String, dynamic>)['idadePet'];
    nomePet = (snap.data() as Map<String, dynamic>)['nomePet'];
    typePet = (snap.data() as Map<String, dynamic>)['typePet'];
   });
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
                      image: NetworkImage('$fotoPet')),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 10, top: 10, right: 10, bottom: 10),
            width: MediaQuery.of(context).size.width/1.2,
            height: MediaQuery.of(context).size.height/8,
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
                        Text('$nomePet', style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8,),
                        Text('$idadePet',
                          style: GoogleFonts.poppins(fontSize: 12),),
                        SizedBox(width: 8,),
                        Text('$typePet',style: GoogleFonts.poppins(fontSize: 0.1),)



                      ],

                    ),
                    Container(
                      padding: EdgeInsets.only(left: 6,
                          right: 6,
                          bottom: 6,
                          top: 6),
                      child: Icon(
                        Icons.star_outline, size: 26,color: Colors.amber,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            30),

                      ),
                    )
                  ],
                ),
                SizedBox(height: 3,),
                Row(
                  children: [
                    Icon(Icons.place_outlined, size: 18,),
                    SizedBox(width: 4,),
                    Text('$distancia',
                      style: GoogleFonts.poppins(fontSize: 16),)
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
