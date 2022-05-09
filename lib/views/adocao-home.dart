
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tier/data/pet_data.dart';
import 'package:tier/widgets/pet_list.dart';

import '../widgets/bottom_nav_bar.dart';

class AdocaoHome extends StatefulWidget {
  AdocaoHome({Key? key,
  }) : super(key: key);

  @override
  State<AdocaoHome> createState() => _AdocaoHomeState();
}

class _AdocaoHomeState extends State<AdocaoHome> {
  List<bool> isSelected = [true,false,false,false];
  List<String> petIcons = ['https://cdn3.iconfinder.com/data/icons/font-awesome-solid/576/dog-256.png','https://cdn1.iconfinder.com/data/icons/pets-and-animals-5/96/cat-256.png','https://cdn-icons-png.flaticon.com/512/3969/3969770.png','https://cdn1.iconfinder.com/data/icons/animals-178/400/parrot-256.png'];
  String? location = "tomás rodrigues, 1361";
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

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Row(
          children: [
            SizedBox(
              width: location == null ? 65 : MediaQuery.of(context).size.width/2-23,
              child: Text(
                location == null ? 'endereço' : location!,
                style: const TextStyle(color: Colors.black, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
              },
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 18,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
              },
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.chat_bubble_rounded,
                color: Colors.black,
                size: 18,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          // escolher os bixos
          Ink(


            width: 350,
            height: 100,
            color: Colors.white.withOpacity(0.3),
            child: GridView.count(

                primary: true,
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
                children:
                List.generate(isSelected.length, (index) => InkWell(
                  splashColor: Colors.white54,
                  onTap: (){
                    setState(() {
                      for( int indexBtn =0;
                      indexBtn< isSelected.length;indexBtn++){
                        if (indexBtn==index){
                          isSelected[indexBtn] = true;
                        } else {
                          isSelected[indexBtn] =false;
                        }
                      }
                    });
                  },
                  child: Ink(

                    decoration: BoxDecoration(
                      image:  DecorationImage(
                          opacity: 0.7,
                          image: NetworkImage(petIcons[index]))  ,

                      color: isSelected[index] ? Color(0xFFffb761) : Color(0xE6FFC368).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(30),


                    ),


                  ),
                ))

            ),
          ),

          Row(
            children: [
              SizedBox(width: 28,),
              Text("Cachorros"),
              SizedBox(width: 39,),
              Text("Gatos"),
              SizedBox(width: 43,),
              Text("Roedores"),
              SizedBox(width: 33,),
              Text("Pássaros"),


            ],
          ),


          //escolher os filtros
          Container(
              height: 80,
              padding: EdgeInsets.only(left: 20),
              child:
              Row(
                children: [
                  Container(

                    width: 80,
                    height: 40,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFffb761),


                    ),

                    padding: EdgeInsets.only(top: 8,bottom: 5,left: 5,right: 5),
                    child: Text(
                      "Filtros", style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ), textAlign:TextAlign.center ,
                    ),

                  ),
                  SizedBox(width: 10,),
                  Container(

                    width: 90,
                    height: 40,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffe5e5e5),


                    ),

                    padding: EdgeInsets.only(top: 8,bottom: 5,left: 5,right: 5),
                    child: Text(
                      "Distância", style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ), textAlign:TextAlign.center ,
                    ),

                  ),
                  SizedBox(width: 10,),
                  Container(

                    width: 70,
                    height: 40,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffe5e5e5),


                    ),

                    padding: EdgeInsets.only(top: 8,bottom: 5,left: 5,right: 5),
                    child: Text(
                      "Idade", style: TextStyle(

                      fontSize: 18,
                      color: Colors.black,
                    ), textAlign:TextAlign.center ,
                    ),

                  ),
                  SizedBox(width: 10,),
                  Container(

                    width: 70,
                    height: 40,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffe5e5e5),


                    ),

                    padding: EdgeInsets.only(top: 8,bottom: 5,left: 5,right: 5),
                    child: Text(
                      "Gênero", style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ), textAlign:TextAlign.center ,
                    ),

                  ),

                ],
              )
          ),

          // feed adocao
          Visibility(
            visible: isSelected[0]?true: false,
            child: Container(
              height: 480,

              child: ListView.builder(
                itemCount: pets.length,
                itemBuilder: (context, index)  => Visibility(
                  visible: isSelected[0]&&pets[index]['typePet']=='Cachorros'? true: false  ,
                  child: PetList(

                    idade: pets[index]['idade'],
                    nome_pet: pets[index]['nome_pet'],
                    //favorite: pets[index]['favorite'],
                    foto_pet: pets[index]['foto_pet'],
                    genero: pets[index]['genero'],
                    distancia:pets[index] ['distancia'],
                    typePet: pets[index]['typePet'],

                  ),
                ),


              ),

            ),
          ),
          Visibility(
            visible: isSelected[1]?true: false,
            child: Container(
              height: 480,

              child: ListView.builder(
                itemCount: pets.length,
                itemBuilder: (context, index)  => Visibility(
                  visible: isSelected[1]&&pets[index]['typePet']=='Gatos'? true: false  ,
                  child: PetList(

                    idade: pets[index]['idade'],
                    nome_pet: pets[index]['nome_pet'],
                    //favorite: pets[index]['favorite'],
                    foto_pet: pets[index]['foto_pet'],
                    genero: pets[index]['genero'],
                    distancia:pets[index] ['distancia'],
                    typePet: pets[index]['typePet'],

                  ),
                ),


              ),

            ),
          ),
          Visibility(
            visible: isSelected[2]?true: false,
            child: Container(
              height: 480,

              child: ListView.builder(
                itemCount: pets.length,
                itemBuilder: (context, index)  => Visibility(
                  visible: isSelected[2]&&pets[index]['typePet']=='Ratos'? true: false  ,
                  child: PetList(

                    idade: pets[index]['idade'],
                    nome_pet: pets[index]['nome_pet'],
                    //favorite: pets[index]['favorite'],
                    foto_pet: pets[index]['foto_pet'],
                    genero: pets[index]['genero'],
                    distancia:pets[index] ['distancia'],
                    typePet: pets[index]['typePet'],

                  ),
                ),


              ),

            ),
          ),
          Visibility(
            visible: isSelected[3]?true: false,
            child: Container(
              height: 480,

              child: ListView.builder(
                itemCount: pets.length,
                itemBuilder: (context, index)  => Visibility(
                  visible: isSelected[3]&&pets[index]['typePet']=='Pássaros'? true: false  ,
                  child: PetList(

                    idade: pets[index]['idade'],
                    nome_pet: pets[index]['nome_pet'],
                    //favorite: pets[index]['favorite'],
                    foto_pet: pets[index]['foto_pet'],
                    genero: pets[index]['genero'],
                    distancia:pets[index] ['distancia'],
                    typePet: pets[index]['typePet'],

                  ),
                ),


              ),

            ),
          ),





        ],
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'pet',),
    );
  }
}