import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tier/firebase/pedido_helper.dart';
import 'package:tier/widgets/carrinho_widgets/modal_novo_endereco.dart';

import '../../colors.dart';

List<Endereco> enderecosTemp =
[
  Endereco(cidade: 'Fortaleza', bairro: 'Benfica', cep: '60000', numero: 51, rua:'Rua das flores'),
  Endereco(cidade: 'Fortaleza', bairro: 'Aldeota', cep: '60000', numero: 52, rua:'Rua Manoel Carvalho'),
  Endereco(cidade: 'Fortaleza', bairro: 'Antônio Bezerra', cep: '60000', numero: 53, rua:'Rua Coronel Leitão'),
];

class MudarLocal extends StatefulWidget {
  final Function onTap;
  const MudarLocal({Key? key, required this.onTap}) : super(key: key);

  @override
  State<MudarLocal> createState() => _MudarLocalState();
}

class _MudarLocalState extends State<MudarLocal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.cinzaClaro,
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: enderecosTemp.map(
                          (e) => GestureDetector(
                            onTap: () {
                              widget.onTap(e);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.cinzaClaro, width: 0.8),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${e.rua}, ${e.numero}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    const SizedBox(height: 3,),
                                    Text(
                                      '${e.bairro}  -  ${e.cidade}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                  ).toList(),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  return showMaterialModalBottomSheet(
                      expand: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => NovoEndereco(onTap: widget.onTap));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                      width: MediaQuery.of(context).size.width-30,
                      color: AppColor.textosPretos2,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Novo endereço',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
