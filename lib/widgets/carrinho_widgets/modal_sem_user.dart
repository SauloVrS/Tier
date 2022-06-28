import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../colors.dart';
import '../../views/auth_page.dart';

class ModalSemUser extends StatefulWidget {
  const ModalSemUser({Key? key}) : super(key: key);

  @override
  State<ModalSemUser> createState() => _ModalSemUserState();
}

class _ModalSemUserState extends State<ModalSemUser> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      child: Container(
        color: Colors.white,
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
                'É necessário estar logado para adicionar produtos ao carrinho.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Deseja efetuar o login ou o cadastro?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 12
                ),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const authPage()));
                showCupertinoModalBottomSheet(
                    enableDrag: true,
                    topRadius: const Radius.circular(30),
                    barrierColor: const Color.fromARGB(100, 0, 0, 0),
                    context: context,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height/1.18,
                      child: const authPage(),
                    )
                );
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
                        Expanded(
                          child: Text(
                            'Realizar login ou cadastro',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(height: 10,),
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
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
