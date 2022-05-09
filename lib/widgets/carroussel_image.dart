import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carrousselimage extends StatelessWidget {
  Carrousselimage({Key? key}) : super(key: key);

  final List<String> banners = [
    "https://http2.mlstatic.com/D_NQ_NP_2X_849115-MLB25170140853_112016-F.jpg",
    "https://www.pontofrio-imagens.com.br/PetShop/cachorro/HigieneBelezacanina/1501004272/1197683516/shampoo-para-caes-5-em-1-pro-canine-700-ml-1501004272.jpg",
    "https://th.bing.com/th/id/OIP.-gJJR_HNn-a-fo0wXyMZCwHaHa?pid=ImgDet&rs=1",
    "https://www.petshop25.com.br/image/cache/data/eftr/Img_ftr_rp_24002-1160x1160.JPG"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:const [
              Text("Visto recentemente", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),
              Text("limpar", style: TextStyle(color: Color(0xFFFFD595)),),
            ],
          ),
        ),
        CarouselSlider(
          //Banners
          options: CarouselOptions(
              height: 190,
              disableCenter: true,
              viewportFraction: 0.4,
              enableInfiniteScroll: false,
              padEnds: false),
          items: banners
              .map((e) => Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 13),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                e,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ))
              .toList(),
        ),
      ],
    );
  }
}
