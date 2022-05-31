import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tier/views/chat/chatmodels/messages.dart';
import 'package:tier/views/chat/chatmodels/user.dart';

class ChatScreen extends StatefulWidget {
  //final User ?user;
  final friendUid;
  final friendName;
  
   ChatScreen({this.friendUid, this.friendName });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final random = Random();
  
  
  
  String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  CollectionReference chats = FirebaseFirestore.instance.collection('chats');

  var chatDocId;
 // final currentUserId = FirebaseAuth.instance.currentUser?.uid; 
  final currentUserId = "g6afMeF0UzD6u7XgNrRe";
  final _textController = TextEditingController();
   @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    await chats
        .where('users', isEqualTo: {widget.friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              setState(() {
                chatDocId = querySnapshot.docs.single.id;
              });

              print(chatDocId);
            } else {
              await chats.add({
                'users': {currentUserId: null, widget.friendUid: null},
                'names':{currentUserId:"Antonio Jose",widget.friendUid:widget.friendName }
              }).then((value) => {chatDocId = value});
            }
          },
        )
        .catchError((error) {});
  }
void sendMessage(String msg) {
   
    if (msg == '') return;
    
   
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'friendName':widget.friendName,
      'friendUid':widget.friendUid,
      'msg': msg,
      'unread':true
    }).then((value) {
      _textController.text = '';
     
    });
  }
bool isSender(String friend) {
    return friend == currentUserId;
}
  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
                
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () => /*print("onpressed")*/ sendMessage(_textController.text),
          ),
        ],
      ),
    );
  }

 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: chats
        .doc(chatDocId)
        .collection('messages')
        .orderBy('createdOn',descending: true)
        .snapshots(),
        builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              )//Text("Loading"),
            );
          }
          
          if (snapshot.hasData) {
             var data;
            return  Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                title: Row(
                  children:  <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(randomPictureUrl()),
                    ),
                    const SizedBox(width: 10.0,),
                     Text(
                      widget.friendName.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color:Colors.black,
                      ),
                    ),
                     
                  ],
                ),
                elevation: 0.0,
                actions:<Widget>[
                  IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.more_horiz),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                ]
              ),
              body: 
                Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          child: ListView(
                            reverse: true,
                            padding: const EdgeInsets.only(top: 15.0),
                            children:snapshot.data!.docs.map(
                              (DocumentSnapshot document){

                                data = document.data()!;
                                if(data['unread'] == true &&  isSender(data['uid'].toString()) == false){
                                  chats.doc(chatDocId).collection('messages').doc(document.id).update({
                                      'unread':false
                                    }).then((value) {

                                    });
                                }
                               
                                return Container(
                                  
                                  margin: isSender(data['uid'].toString())//data['uid'] == 'ruIsAYtD9XNy2LGGcgAQh0c4u3N2'
                                      ? const EdgeInsets.only(
                                         top: 10.0,
                                          bottom: 10.0,
                                          left: 80.0,
                                          right: 5.0
                                      )
                                      : const EdgeInsets.only(
                                        top: 8.0,
                                        bottom: 10.0,
                                        left: 5.0
                                      ),
                                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  decoration: BoxDecoration(
                                    color: isSender(data['uid'].toString())//data['uid'] == 'ruIsAYtD9XNy2LGGcgAQh0c4u3N2'
                                        ? Color.fromARGB(255, 214, 253, 237) : Color.fromARGB(255, 197, 238, 250),
                                    borderRadius: isSender(data['uid'].toString())//data['uid'] == 'ruIsAYtD9XNy2LGGcgAQh0c4u3N2'
                                        ? const BorderRadius.only(
                                          topLeft: Radius.circular(15.0),
                                          bottomLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0),
                                        )
                                        : const BorderRadius.only(
                                          topRight: Radius.circular(15.0),
                                          bottomRight: Radius.circular(15.0),
                                          topLeft: Radius.circular(15.0),
                                        ), 

                                  ),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  <Widget>[
                                       Text(
                                       data['createdOn'] == null
                                          ? DateTime.now().toString()
                                          : data['createdOn']
                                            .toDate()
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        )
                                      ),

                                      const SizedBox(height: 8.0),
                                      Text(
                                        data['msg'],
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]
                                  ),
                                );    
                              }
                            ).toList(),
                          ),
                        ),
                      ),
                    ),
                    _buildMessageComposer(),
                  ]
                ),
            );
          }
          else{
            return Container();
          }
        },
    );
  }  

}


