import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String> signUpUser({
    required String email,
    required String password,
    required String passwordConfirm,
    required String username,
  }) async {
    String res = 'Ocorreu algum erro';
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          passwordConfirm.isNotEmpty &&
          username.isNotEmpty) {
        if (password == passwordConfirm) {
          UserCredential userCredential =
              await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          print(userCredential.user!.uid);

          _firestore.collection('usuarios').doc(userCredential.user!.uid).set({
            'nomeUsuario': username,
            "email": email,
            'idUsuario': userCredential.user!.uid,
            'pontos': 0,
            'descricaoUsuario': "nenhuma descrição",
            'enderecoUsuario': [""],
            'fotoUsuario': null,
          });
        } else {
          return res = 'As senhas não coincidem.';
        }
        return res = 'Cadastro concluido com sucesso!';
      } else {
        return res = 'Preencha todos os campos!';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Ocorreu algum erro';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'Login efetuado com sucesso!';
      } else {
        res = 'Preencha os campos!';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  Future<String> googleLogin() async {
    String res = 'Ocorreu algum erro';
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      res = 'success';

      print(userCredential.user!.uid);

      _firestore.collection('usuarios').doc(userCredential.user!.uid).set({
        'nomeUsuario': userCredential.user!.displayName,
        "email": userCredential.user!.email,
        'idUsuario': userCredential.user!.uid,
        'pontos': 0,
        'descricaoUsuario': "nenhuma descrição",
        'enderecoUsuario': [""],
        'fotoUsuario': userCredential.user!.photoURL,
      });
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
