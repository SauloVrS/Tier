import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// arquivos com exemplos:
import 'package:tier/data/banners.dart';
import 'package:tier/data/lojas.dart';
import 'package:tier/data/produtos.dart';
import 'package:tier/data/promocoes.dart';
import 'package:tier/data/servicos.dart';
import 'package:tier/firebase/loja_helper.dart';
import 'package:tier/views/carrinho/carrinho_inicial.dart';
import 'package:tier/views/chat/screens/chat_home_screen.dart';

// arquivos de widgets
import 'package:tier/widgets/banners.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';
import 'package:tier/widgets/carrinho_widgets/icon_carrinho.dart';
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
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black, fontSize: 13),
                ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CarrinhoPage()));
              },
              constraints: const BoxConstraints(),
              icon: const IconCarrinho(),
              // const Icon(
              //   Icons.shopping_cart,
              //   color: Colors.black,
              //   size: 18,
              // )
          ),
          IconButton(
             onPressed: 
                   () => Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (_) => const HomeScreen(),
                            )
                         ),
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
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 15
              ),
              child: Text(
                "Promoções",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ),
            ),
            streamIds(),
            BannerGeral(imgUrl: banners[1]),
            // Padding(
            //   padding: const EdgeInsets.symmetric( horizontal: 15 ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Serviços",
            //         style: GoogleFonts.poppins(
            //           textStyle: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 20,
            //               fontWeight: FontWeight.w500),
            //         )
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //     height: 125,
            //     child: ListView.builder(
            //       padding: const EdgeInsets.symmetric(horizontal: 15),
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: servicos.length,
            //       itemBuilder: (context, index) {
            //         return SPList(
            //             name: servicos[index]['name'],
            //             imgUrl: servicos[index]['imgUrl'],
            //             );
            //       },
            //     )
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Produtos",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Lojas",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ),
            ),
            StreamBuilder<List<Loja>>(
                stream: readUsers(),
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if(snapshot.hasData){
                    final lojas = snapshot.data!;
                    return ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: lojas.map((loja) => lojaList(loja, 30, context)).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(pagina: 'lojas',),
    );
  }
}
