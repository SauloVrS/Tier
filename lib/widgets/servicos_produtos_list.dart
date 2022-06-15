import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/produtos_type/type_produtos.dart';

class SPList extends StatelessWidget {

  final String name, imgUrl;

  const SPList({Key? key, required this.name, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => TypeProd(type: name),
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 15),
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD6D6D6), width: 1, style: BorderStyle.solid), borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              Image.network(imgUrl, fit: BoxFit.cover, width: 150, height: 70,),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 150,
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: GoogleFonts.poppins(fontSize: 13),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
