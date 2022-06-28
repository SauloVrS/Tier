import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tier/models/pet_model.dart';

pickImage (ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);
   if (_file != null) {
     return await _file.readAsBytes();
   }
   print('No image selected');
}

showSnackBar(String content, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

class StorageMethods{
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //adicionar imagem no firebase storage
  Future<String> uploadImageToStorage(String childName, Uint8List imagefile, bool isPost) async {

    Uint8List imageInUnit8List = imagefile ;
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(imageInUnit8List);

    String fotoid = const Uuid().v1();
    Reference ref = _storage.ref().child(childName).child(fotoid);

    if(isPost) {
      String id = const Uuid().v1();
      ref.child(id);
    }
    UploadTask uploadTask = ref.putFile(file);
    //TaskSnapshot snap = await uploadTask;
    //String downloadUrl = await snap.ref.getDownloadURL();
    //return downloadUrl;
    String url = 'https://i.pinimg.com/474x/ab/0a/b7/ab0ab78441f6e2d77246401aac9e7cd3.jpg';
    await uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();
      print("arquivo salvo");
    }).catchError((onError) {
      print(onError);
    });
    return url;
  }
}

class FireStoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post (criar animal)
  Future<String> adicionarPet(
      Uint8List file,
      String uid,
      String descricaoPet,
      String distanciaPet,
      String generoPet,
      String idadePet,
      String nomePet,
      String typePet,
      String portePet,
      ) async {
    String res = 'ocorreu um erro';
    try{
      String photoUrl = await StorageMethods().uploadImageToStorage('pets/', file, true);

      String petId = const Uuid().v1();
      ModelPet pet = ModelPet(
        idPet: petId,
        idUsuario: uid,
        descricaoPet: descricaoPet,
        distanciaPet: distanciaPet,
        fotoPet: photoUrl,
        generoPet: generoPet,
        idadePet: idadePet,
        nomePet: nomePet,
        typePet: typePet,
        portePet: portePet,
      );
      
      _firestore.collection('usuarios').doc(uid).collection('pets').doc(petId).set(pet.toJson());
      _firestore.collection('pets').doc(petId).set(pet.toJson());
      res = 'success';
    }catch(err){
      res = err.toString();
    }
    return res;
  }

  Future<String> adicionarFotoPerfil(
      Uint8List file,
      String uid,
      ) async {
    String res = 'ocorreu um erro';
    try{
      String photoUrl = await StorageMethods().uploadImageToStorage('fotosPerfil/', file, true);
      final docUser = FirebaseFirestore.instance.collection('usuarios').doc(uid);
      docUser.update({
        'fotoUsuario' : photoUrl,
      });
      res = 'sucess';
    }catch(err){
      res = err.toString();
    }
    return res;
  }

  Future<String> atualizarFotoPet(
      Uint8List file,
      String uid,
      String idPet,
      ) async {
    String res = 'ocorreu um erro';
    try{
      String photoUrl = await StorageMethods().uploadImageToStorage('fotosPerfil/', file, true);
      final docUser = FirebaseFirestore.instance.collection('usuarios').doc(uid).collection('pets').doc(idPet);
      final docUser2 = FirebaseFirestore.instance.collection('pets').doc(idPet);
      docUser.update({
        'fotoPet' : photoUrl,
      });
      docUser2.update({
        'fotoPet' : photoUrl,
      });
      res = 'sucess';
    }catch(err){
      res = err.toString();
    }
    return res;
  }
}