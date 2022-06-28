import 'package:tier/widgets/carroussel_image.dart';
import 'package:tier/views/itens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuscaWidget extends StatefulWidget {
  const BuscaWidget({Key? key}) : super(key: key);

  @override
  State<BuscaWidget> createState() => _BuscaWidgetState();
}

class _BuscaWidgetState extends State<BuscaWidget> {
  //String texto = '';
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFFFFFFF),
          ),
          child: TextField(
            controller: searchController,
            textInputAction: TextInputAction.go,
            onSubmitted: (text) {
              if(searchController.text.isNotEmpty){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuscaItens(text: searchController.text,)));
              }
            },
            cursorColor: Color(0xFFFFD595),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.what_does_your_pet_needs,
              border: InputBorder.none,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(searchController.text.isNotEmpty){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                           builder: (context) => BuscaItens(text: searchController.text,)));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(
                        Icons.search,
                        color: Color(0xFFFFD595),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: const Color(0xFFFFD595),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

