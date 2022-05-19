import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/views/chat/widgets/chat_adocao.dart';
import 'package:tier/views/chat/widgets/chat_lojas.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined), 
          iconSize: 25.0,
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor:Colors.white,
        title:  Text(
          'CHATS',
           style:  GoogleFonts.poppins(
            fontSize: 20,
            color: AppColor.textosPretos3,
            fontWeight: FontWeight.w500,
          ),
          ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs:  <Widget>[
            Tab(
              child: Text(
                'Adoção',
                style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: AppColor.textosPretos3,
                                fontWeight: FontWeight.w400,
                              ),
              ),
             //text: 'Adoção',
            ),
            Tab(
              child: Text(
                'Lojas',
                style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: AppColor.textosPretos3,
                                fontWeight: FontWeight.w400,
                              ),
              ),
            ),
            
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          ChatAdocao(),
          ChatLojas(),
        ],
      ),
    );
  }
}