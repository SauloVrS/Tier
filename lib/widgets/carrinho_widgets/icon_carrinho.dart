import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconCarrinho extends StatefulWidget {
  const IconCarrinho({Key? key}) : super(key: key);

  @override
  State<IconCarrinho> createState() => _IconCarrinhoState();
}

class _IconCarrinhoState extends State<IconCarrinho> {
  List list = [];
  late final DatabaseReference _ref;
  late StreamSubscription<DatabaseEvent> _subscrip;
  var user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init(user?.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: list.isEmpty
          ? const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          )
          : Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                color: Colors.black,

              ),
              Container(
                margin: const EdgeInsets.only(top: 4, right: 0.5),
                child: const Align(
                  child: Icon(Icons.fiber_manual_record, size: 14, color: Colors.white,),
                  alignment: Alignment.topRight,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: const Align(
                  child: Icon(Icons.fiber_manual_record, size: 12, color: Colors.red,),
                  alignment: Alignment.topRight,
                ),
              )
            ],
          ),
    );
  }

  init(String? user) async {
    if(user != null){
      _ref = FirebaseDatabase.instance.ref('users/$user/Carrinho');
      try {
        final snapshot = await _ref.get();
        list = snapshot.value as List;
      } catch (e) {
        print(e.toString());
      }

      _subscrip = _ref.onValue.listen((DatabaseEvent event) {
        setState(() {
          list = (event.snapshot.value ?? []) as List;
        });
      });
    }
  }
}
