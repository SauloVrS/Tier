

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/data/pet_data.dart';
import 'package:tier/views/chat/screens/chat_home_screen.dart';
import 'package:tier/widgets/pet_list.dart';


import '../models/pet_model.dart';
import '../models/users_model.dart';
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
  String dropdownValue = 'Fêmea';
  String dropdownValue2 = 'Distantes';
  String dropdownValue3 = 'Menor idade';




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
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
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
              onPressed:
                  () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  )
              ),
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
          /// escolher os bixos
          Container(
            margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/20, top:MediaQuery.of(context).size.height/250,right:MediaQuery.of(context).size.width/20,bottom:MediaQuery.of(context).size.height/1000),
            child: Column(

              children: [
                Ink(


                  width: MediaQuery.of(context).size.width/1.09,
                  height: MediaQuery.of(context).size.height/9.8,
                  color: Colors.white.withOpacity(0.3),
                  child: GridView.count(

                    primary: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
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
                      child:
                      Ink(

                        decoration: BoxDecoration(
                          image:  DecorationImage(
                              opacity: 0.6,
                              image: NetworkImage(petIcons[index]))  ,

                          color: isSelected[index] ? Color(0xFFffb761) : Color(0xE6FFC368).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(30),


                        ),


                      ),


                    )),


                  ),
                ),




              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height/30),
          ///escolher os filtros
          Container(
              height: MediaQuery.of(context).size.height/13,
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/20,right: MediaQuery.of(context).size.width/28 ,top: 0,bottom: MediaQuery.of(context).size.height/55  ),
              child:
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8,bottom: 5,left: 7,right: 3),
                    child: Text("Filtros" , style: GoogleFonts.poppins(color: Colors.white),),
                    width: MediaQuery.of(context).size.width/6.5,
                    height: 40,


                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xE6FFC368),


                    ),),
                  SizedBox(width: MediaQuery.of(context).size.width/45),

                  Container(
                    width: MediaQuery.of(context).size.width/3.6,
                    height: 40,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffe5e5e5),


                    ),

                    padding: EdgeInsets.only(top: 5,bottom: 5,left: 12,right: 4),
                    child: DropdownButton<String>(
                      value: dropdownValue2,

                      elevation: 16,
                      style: const TextStyle(color: Colors.black),

                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                      },
                      items: <String>['Distantes', 'Próximos']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),

                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/45),
                  Container(
                    width: MediaQuery.of(context).size.width/3.1,
                    height: 40,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffe5e5e5),


                    ),

                    padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 3),
                    child: DropdownButton<String>(
                      value: dropdownValue3,

                      elevation: 16,
                      style: const TextStyle(color: Colors.black),

                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue3 = newValue!;
                        });
                      },
                      items: <String>['Menor idade', 'Maior idade']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),

                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/45),

                  Container(
                    width: MediaQuery.of(context).size.width/4.5,
                    height: 40,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffe5e5e5),


                    ),

                    padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 3),
                    child: DropdownButton<String>(
                      value: dropdownValue,

                      elevation: 16,
                      style: const TextStyle(color: Colors.black),

                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[ 'Fêmea', 'Macho']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),

                        );
                      }).toList(),
                    ),
                  )

                ],
              )
          ),

          /// feed adocao
          Expanded(
            child: StreamBuilder<List<ModelPet>>(
                stream: readPets(isSelected,dropdownValue,dropdownValue2),
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if(snapshot.hasData){
                    final pets = snapshot.data!;
                    return pets.length == 0 ? Center() :  ListView(
                      //physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: pets.map((pet) => PetList(pet: pet,  idUsuario: '',)).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
            ),
          ),








          //bottom navigator bar


        ],
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'pet',),
    );
  }
}
