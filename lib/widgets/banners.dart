import 'package:flutter/material.dart';

class BannerGeral extends StatelessWidget {

  final String imgUrl;

  const BannerGeral({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imgUrl, fit: BoxFit.cover,)
      ),
    );
  }
}