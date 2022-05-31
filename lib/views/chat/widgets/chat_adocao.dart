import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:tier/views/chat/chatmodels/messages.dart';
import 'package:tier/views/chat/screens/chat_screen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tier/views/chat/chatmodels/lib.dart';
import 'package:intl/intl.dart';
class ChatAdocao extends StatefulWidget {
  const ChatAdocao({ Key? key }) : super(key: key);

  @override
  State<ChatAdocao> createState() => _ChatAdocaoState();
}

class _ChatAdocaoState extends State<ChatAdocao> {

  @override
  void initState() {
    super.initState();
    chatState.refreshChatsForCurrentUser();
  }
  final random = Random();
  String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }
  void changeUnread(docId,messageId){
    CollectionReference chats = FirebaseFirestore.instance.collection('chats');
    chats.doc(docId).collection('messages').doc(messageId).update({
      'unread':false
    }).then((value) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(

       builder: (BuildContext context) =>  Expanded( 
                child: Container(
                  //padding: const EdgeInsets.only(top: 20.0, left:20.0,right: 20.0,bottom:10),
                  padding: const EdgeInsets.only(top: 10.0),
                  child:  ListView(
                    //padding: const EdgeInsets.only(top: 10.0, left: 10.0,right: 15.0,), 
                    children:chatState.messages.values.toList().map((data) {
                    
                     //print(data['friendName'].toString()+"//"+data['friendUid']+"testest testes testes teste");
                     return Container(
                        padding: const EdgeInsets.only(top: 10.0, left: 10.0,right: 15.0,),
                        child:ListTile(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                     leading:
                       CircleAvatar(
                        radius: 35.0,
                       backgroundImage: NetworkImage(randomPictureUrl()),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                    title: Text(
                      data['friendName'],
                      style: 
                        const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        ),
                      ),
                    subtitle: Text(data['msg']),
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    trailing: Column(
                      children:  <Widget>[
                         Text(
                          DateFormat.Hm().format(data['time'].toDate()),
                         
                          style: 
                            const TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                            ),
                         ),
                          const SizedBox(height: 5.0),
                     data['unread'] 
                      ? Container(
                          width: 40.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
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
                        :const Text(''),
                      ]
                    ),
                    onTap: () {
                     changeUnread(data['docId'],data['messageId']);
                      Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(friendUid: data['friendUid'], friendName:data['friendName'])
                        ),
                     );
                    }
                    )
                     );
                     
                }).toList()
                )
              ) ,
     )
     );
  }
}

/***
 * return Expanded(
     child: Container(
        color:Colors.white,
        padding: const EdgeInsets.only(top: 10.0,),
        child:ListView.builder(
          itemCount:chats.length,
          itemBuilder:(BuildContext context, int index) {
           final Message chat = chats[index];
           return GestureDetector(
              onTap:() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      user: chat.sender,
                    ),
                  
                  ),
              ),
              child: 
                Container(
                padding: const EdgeInsets.only(top: 10.0, left: 5.0,right: 15.0,),
                child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                 // side: const BorderSide(color: Colors.black, width: 1)
                ),
                
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                leading:
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage: NetworkImage(randomPictureUrl()),
                ),
                title:  Text(
                  chat.sender.name,
                  style: 
                    const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        ),
                  ),
                subtitle: Text(chat.text),
                trailing: Column(
                  children:  <Widget>[
                    Text(
                      chat.time,
                      style: 
                        const TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      chat.unread 
                      ? Container(
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
                        :const Text(''),
                      
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
 * 
 * 
 */