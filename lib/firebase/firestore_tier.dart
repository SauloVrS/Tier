import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tier/firebase/user.dart';


// widget para lista uma unica coleção
Widget futureBuildFirebase() {
  return FutureBuilder<User?>(
    future: readUser(),
    builder: (context, snapshot){
      if(snapshot.hasError){
        return Text('Something went wrong! ${snapshot.error}');
      } else if(snapshot.hasData){
        final user = snapshot.data;
        return user == null
            ? const Center(child: Text('No User found!'))
            : SafeArea(child: buildUser(user));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}

//widget para listar varias coleções
Widget streamBuildFirebase() {
  return StreamBuilder<List<User>>(
    stream: readUsers(),
    builder: (context, snapshot){
      if(snapshot.hasError){
        return Text('Something went wrong! ${snapshot.error}');
      } else if(snapshot.hasData){
        final users = snapshot.data!;
        return ListView(
          children: users.map(buildUser).toList(),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }
  );
}

// exemplos de widget usado, substituir depois
// substituir parametro
Widget buildUser(User user) => ListTile(
  leading: CircleAvatar(child: Text(user.age)),
  title: Text(user.name),
);

// get dados de uma unica coleção
// substituir classe "User"
Future<User?> readUser() async {
  final docUser = FirebaseFirestore.instance.collection('users').doc('2Stga0Cqy8CVS1oYxg6w');
  final snapshot = await docUser.get();
  if(snapshot.exists) {
    return User.fromJson(snapshot.data()!);
  }
}

// get dados de várias coleções
// substituir classe "User"
Stream<List<User>> readUsers() => FirebaseFirestore.instance
    .collection("users")
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());



