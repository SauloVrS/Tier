import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tier/views/chat/chatmodels/messages.dart';
import 'package:tier/views/chat/screens/chat_screen.dart';

class ChatAdocao extends StatefulWidget {
  const ChatAdocao({ Key? key }) : super(key: key);

  @override
  State<ChatAdocao> createState() => _ChatAdocaoState();
}

class _ChatAdocaoState extends State<ChatAdocao> {
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
}

