import 'dart:math';

import 'package:flutter/material.dart';

class ChatLojas extends StatefulWidget {
  const ChatLojas({ Key? key }) : super(key: key);

  @override
  State<ChatLojas> createState() => _ChatLojasState();
}

class _ChatLojasState extends State<ChatLojas> {
  final random = Random();
  String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }
  @override
  Widget build(BuildContext context) {
   return Expanded(
     child: Container(
         color:Colors.white,
     
        padding: const EdgeInsets.only(top: 10.0),
        child:ListView.builder(
          itemCount:2,
          itemBuilder:(BuildContext context, int index) {
           return GestureDetector(
              onTap: (){},
              child: 
                Container(
              padding: const EdgeInsets.only(top: 10.0, left: 5.0,right: 15.0,),
              child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              leading:
               CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage(randomPictureUrl()),
              ),
              title: const Text(
                'Ponto Da Ração',
                style: 
                  TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      ),
                ),
              subtitle: const Text('Finalizado 21:40'),
              trailing: Column(
                children:  <Widget>[
                  const Text(
                    '21:40',
                    style: 
                      TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                                  width: 40.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'NEW',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                    
                ],
              ),
             
            ),
            ),
            );
          }
        ),
     )
    );
  }
}