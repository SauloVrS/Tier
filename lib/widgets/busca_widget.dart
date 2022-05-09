import 'package:flutter/material.dart';

class Buscawidget extends StatelessWidget {
  const Buscawidget({Key? key}) : super(key: key);

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
            cursorColor: Color(0xFFFFD595),
            decoration: InputDecoration(
              hintText: "Do que seu pet precisa?",
              border: InputBorder.none,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(
                      Icons.search,
                      color: Color(0xFFFFD595),
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
