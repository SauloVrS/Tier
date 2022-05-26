import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';
import 'package:tier/views/main_lojas.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';


class Cupons extends StatefulWidget {
  const Cupons({Key? key}) : super(key: key);

  @override
  State<Cupons> createState() => _CuponsState();
}

class _CuponsState extends State<Cupons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text('CUPONS',
            style: GoogleFonts.poppins(
              color: Color.fromRGBO(27, 27, 27, 0.8),
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){ Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => TelaPerfilUsuario(),
                ));
          },
          icon: const Icon( Icons.arrow_back_ios, color: Color(0xFF6E6E6E))
      )
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 200,
              width: (MediaQuery.of(context).size.width) - 60,
              decoration:
              BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(1, 1),
                  color: AppColor.cinzaBranco,
                ),
              ]
            ),

             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.asset(
                         'images/img_cupom.png'
                     ),

                     Column(
                       children: [
                         RichText(
                           text: TextSpan(
                               text: 'Adicionar Código ',
                               style: GoogleFonts.poppins(
                                   fontSize: 18,
                                   color: AppColor.textosPretos3),
                               ),
                         ),
                         const SizedBox(height: 10,),
                         Container(
                          child:
                          Text('HASGDJAHD',
                            style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),),
                          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                               boxShadow: [
                                 BoxShadow(
                                   blurRadius: 10,
                                   offset: const Offset(1, 1),
                                   color: AppColor.cinzaBranco,
                                 ),
                               ]
                           ),
                         ),
                         const SizedBox(height: 10,),
                         ElevatedButton(
                           onPressed: (){
                             Navigator.pushReplacement(context,
                                 MaterialPageRoute(
                                   builder: (context) => MainLojas(),//não vai pra aí no fim
                                 )
                             );
                           },
                           child: Text('Adicionar'),
                           style: ElevatedButton.styleFrom(
                             primary: Colors.deepOrangeAccent,
                             padding: EdgeInsets.all(10.0),

                           ),
                         ),

                       ],
                     ),

                   ],
                 )
               ],
             ),
          ),
          ),
          Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                height: 100,
                width: (MediaQuery.of(context).size.width) - 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: AppColor.cinzaBranco,
                      ),
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          color: AppColor.textosPretos3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: '40 off para quem adotou \n',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: AppColor.textosPretos3),
                              children:
                              const [
                                TextSpan(
                                  text: ' um pet',
                                )
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
          Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: 100,
                width: (MediaQuery.of(context).size.width) - 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: AppColor.cinzaBranco,
                      ),
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          color: AppColor.textosPretos3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: '10% off para primeira        \n',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: AppColor.textosPretos3),
                              children:
                              const [
                                TextSpan(
                                  text: ' compra',
                                )
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
          Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: 100,
                width: (MediaQuery.of(context).size.width) - 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: AppColor.cinzaBranco,
                      ),
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          color: AppColor.textosPretos3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'RS 10 off para 100 pontos \n',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: AppColor.textosPretos3),
                              children:
                              const [
                                TextSpan(
                                  text: ' acumulados',
                                )
                              ]),
                        )
                      ],
                    )

                  ],
                ),
              )
          ),
          Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: 100,
                width: (MediaQuery.of(context).size.width) - 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: AppColor.cinzaBranco,
                      ),
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          color: AppColor.textosPretos3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'RS 20 off para 200 pontos  \n',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: AppColor.textosPretos3),
                              children:
                              const [
                                TextSpan(
                                  text: ' acumulados',
                                )
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
          Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: 100,
                width: (MediaQuery.of(context).size.width) - 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: AppColor.cinzaBranco,
                      ),
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          color: AppColor.textosPretos3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'frete grátis para compra\n',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: AppColor.textosPretos3),
                              children:
                              const [
                                TextSpan(
                                  text: ' acima de  RS 100',
                                )
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
         ]),

    );
}
}
