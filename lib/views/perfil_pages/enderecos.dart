import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tier/colors.dart';
import 'package:tier/models/users_model.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';
import 'package:tier/widgets/perfil_pages/modal_adicionar_endereco.dart';
import 'package:tier/widgets/perfil_pages/modal_exluir_editar_endereco.dart';
class EnderecosPage extends StatefulWidget {
  const EnderecosPage({Key? key}) : super(key: key);

  @override
  _EnderecosPageState createState() => _EnderecosPageState();
}

class _EnderecosPageState extends State<EnderecosPage> {
  String? idUsuario = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: Column(
          children: [
            Text(
              'ENDEREÇOS',
              style: GoogleFonts.poppins(
                color: Color.fromRGBO(27, 27, 27, 0.8),
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){ Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => TelaPerfilUsuario(),
            ));
            },
            icon: const Icon( Icons.arrow_back_ios, color: Color(0xFF6E6E6E))
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<ModelEnderecos>>(
              stream: readEnderecos(idUsuario!),
              builder: (context, snapshot){
                if (snapshot.hasError) {
                  return Text(
                      'Something went wrong! ${snapshot.error}');
                } else if (snapshot.hasData){
                  final enderecos = snapshot.data;
                  if (enderecos!.isEmpty){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 15,),
                              Text(
                                'Você ainda não tem endereços salvos...',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Adicione um novo\n',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: AppColor.textosPretos3),
                                    children: const [
                                      TextSpan(
                                        text: 'endereço agora mesmo',
                                      )
                                    ]
                                ),
                              ),
                              const SizedBox(height: 10,),
                              GestureDetector(
                                onTap: (){
                                  showMaterialModalBottomSheet(
                                      expand: false,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) => AdicionarEndereco());
                                },
                                child: Container(
                                  width: 250,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: AppColor.amareloPrincipal.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.cinzaBranco,
                                          blurRadius: 0.8,
                                          offset: const Offset(2, 2),
                                        ),
                                      ]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Adicionar novo endereço',
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.textoBranco,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showMaterialModalBottomSheet(
                                expand: false,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => AdicionarEndereco());
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            height: 70,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.black.withOpacity(0.6),
                              color: AppColor.amareloPrincipal.withOpacity(0.7),
                            ),
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                Icon(Icons.add,
                                  color: AppColor.textoBranco,
                                  size: 30,
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  'Adicionar novo endereço',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.textoBranco),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: enderecos.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                                height: 110,
                                width: (MediaQuery.of(context).size.width) - 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColor.cinzaBranco),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        offset: const Offset(1, 1),
                                        color: AppColor.cinzaBranco.withOpacity(0.8),
                                      ),
                                    ]
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 15,),
                                    Icon(Icons.location_on_outlined,
                                      color: AppColor.textosPretos2,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${enderecos[index].rua}, ${enderecos[index].numero}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                        Text(enderecos[index].bairro,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: AppColor.textosPretos2),
                                        ),
                                        Text('${enderecos[index].cidade}/${enderecos[index].estado}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: AppColor.textosPretos2),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(enderecos[index].pontoRef,
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: AppColor.textosPretos2),
                                        )
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            showMaterialModalBottomSheet(
                                                expand: false,
                                                backgroundColor: Colors.transparent,
                                                context: context,
                                                builder: (context) => ModalEditEnd(idEnd: enderecos[index].idEnd,));
                                          },
                                          child: Icon(Icons.more_vert_outlined),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 15,),
                                  ],
                                ),
                              );
                            }
                        ),
                      ],
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
