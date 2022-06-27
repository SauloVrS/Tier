import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';
import '../../firebase/adicionar_imagens.dart';

class ModalEditEnd extends StatefulWidget {
  final String idEnd;
  const ModalEditEnd({Key? key, required this.idEnd}) : super(key: key);

  @override
  _ModalEditEndState createState() => _ModalEditEndState();
}

class _ModalEditEndState extends State<ModalEditEnd> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      child: Container(
        color: AppColor.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.cinzaClaro,
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'O que você deseja fazer com esse endereço?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    color: AppColor.amareloPrincipal,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Editar endereço',
                          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                final docUser = FirebaseFirestore.instance
                    .collection('usuarios')
                    .doc(idUsuario)
                    .collection('enderecos')
                    .doc(widget.idEnd);
                docUser.delete();
                showSnackBar('Endereço excluido com sucesso', context);
                Navigator.pop(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    color: AppColor.textosPretos2,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Excluir endereço',
                          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cancelar',
                          style: GoogleFonts.poppins(color: AppColor.textosPretos2),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
