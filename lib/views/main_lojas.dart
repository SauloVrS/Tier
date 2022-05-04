import 'package:flutter/material.dart';

// arquivos com exemplos:
import 'package:tier/data/banners.dart';
import 'package:tier/data/lojas.dart';
import 'package:tier/data/produtos.dart';
import 'package:tier/data/promocoes.dart';
import 'package:tier/data/servicos.dart';

// arquivos de widgets
import 'package:tier/widgets/banners.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';
import 'package:tier/widgets/lojas_list.dart';
import 'package:tier/widgets/promocoes_list.dart';
import 'package:tier/widgets/servicos_produtos_list.dart';

class MainLojas extends StatefulWidget {
  const MainLojas({Key? key}) : super(key: key);

  @override
  State<MainLojas> createState() => _MainLojasState();
}

class _MainLojasState extends State<MainLojas> {
  String? location = "tomás rodrigues, 1361";
  List<Map> promocoesFeed = [];
  List<Map> servicos = [];
  List<Map> produtos = [];
  List<String> banners = [];
  List<Map> lojas = [];

  initData() {
    promocoesFeed = Promo().promocoes;
    servicos = Service().servicos;
    produtos = Produtos().produtos;
    banners = BannersData().banners;
    lojas = Lojas().lojas;
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Row(
          children: [
            SizedBox(
              width: location == null ? 65 : MediaQuery.of(context).size.width/2-23,
              child: Text(
                location == null ? 'endereço' : location!,
                style: const TextStyle(color: Colors.black, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
             },
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 18,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
              },
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 18,
              )),
          IconButton(
              onPressed: () {
              },
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.chat_bubble_rounded,
                color: Colors.black,
                size: 18,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "https://storage.googleapis.com/promodebolso_static_files/pdb_resources/walmart-banner.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Promoções",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
                height: 235,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: promocoesFeed.length,
                  itemBuilder: (context, index) {
                    return PromoList(
                        title: promocoesFeed[index]['title'],
                        imgUrl: promocoesFeed[index]['url'],
                        price: promocoesFeed[index]['price'],
                        newPrice: promocoesFeed[index]['newPrice']);
                  },
                )
            ),
            BannerGeral(imgUrl: banners[1]),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 15 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Serviços",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: const Text(
                      "Ver mais",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 125,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: servicos.length,
                  itemBuilder: (context, index) {
                    return SPList(
                        name: servicos[index]['name'],
                        imgUrl: servicos[index]['imgUrl'],
                        );
                  },
                )
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Produtos",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: const Text(
                      "Ver mais",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 125,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    return SPList(
                      name: produtos[index]['name'],
                      imgUrl: produtos[index]['imgUrl'],
                    );
                  },
                )
            ),
            BannerGeral(imgUrl: banners[0]),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Lojas",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              children: [
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: lojas.map((e) => LojasList(name: e['name'], imgUrl: e['imgUrl'], stars: e['stars'], distancia: e['distancia'], tempoMin: e['tempoMin'], tempoMax: e['tempoMax'], taxa: e['taxa'], situacao: e['aberto'])).toList(),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'lojas',),
    );
  }
}
