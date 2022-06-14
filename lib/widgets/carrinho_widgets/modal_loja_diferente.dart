import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/colors.dart';
import 'package:tier/widgets/carrinho_widgets/carrinho_functions.dart';

import '../../firebase/produto_helper.dart';

class ModalLojaDiferente extends StatefulWidget {
  final String user;
  final Produto produto;
  final String lojaId;
  final int qnt;
  const ModalLojaDiferente({Key? key, required this.user, required this.produto, required this.lojaId, required this.qnt}) : super(key: key);

  @override
  State<ModalLojaDiferente> createState() => _ModalLojaDiferenteState();
}

class _ModalLojaDiferenteState extends State<ModalLojaDiferente> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Você só pode adicionar itens de uma loja por vez.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Deseja esvaziar o carrinho e adicionar este item?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12
                ),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                apagarUser(widget.user);
                final num valor = widget.produto.promocao ? widget.produto.novoValor : widget.produto.valor;
                final produto = ShopProd(idProduto: widget.produto.id, idLoja: widget.lojaId, quantidade: widget.qnt, valor: valor);
                addCarrinho(widget.user, produto.toJson());
                int count = 0;
                Navigator.of(context).popUntil((route) {
                  return count++ == 2;
                });
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
                          'Esvaziar carrinho e adicionar',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cancelar',
                          style: GoogleFonts.poppins(color: AppColor.textosPretos2),
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
    );
  }
}
