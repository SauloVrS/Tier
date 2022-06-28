import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Experimentebuscar extends StatelessWidget {
  const Experimentebuscar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 22),
          child: Text(AppLocalizations.of(context)!.trysearch, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 32),
                    child: Icon(Icons.search, color: Color(0xFFFFD595),),
                  ),
                  Text(AppLocalizations.of(context)!.dogfood, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)),
                ]
              ),
            ),
            Container(height: 1, width: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 6, top: 15),
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 32),
                      child: Icon(Icons.search, color: Color(0xFFFFD595),),
                    ),
                    Text(AppLocalizations.of(context)!.shampoo_for_dogs, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)),
                  ]
              ),
            ),
            Container(height: 1, width: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 6, top: 15),
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 32),
                      child: Icon(Icons.search, color: Color(0xFFFFD595),),
                    ),
                    Text(AppLocalizations.of(context)!.catfood, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)),
                  ]
              ),
            ),
            Container(height: 1, width: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 6, top: 15),
              child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 32),
                      child: Icon(Icons.search, color: Color(0xFFFFD595),),
                    ),
                    Text(AppLocalizations.of(context)!.dogtoy, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)),
                  ]
              ),
            ),
            Container(height: 1, width: 30,)
          ],
        )
      ],
    );
  }
}
