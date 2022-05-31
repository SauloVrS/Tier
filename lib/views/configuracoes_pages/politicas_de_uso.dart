import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tier/views/perfil_pages/perfil_usuario.dart';
import 'package:tier/colors.dart';
import 'package:tier/widgets/bottom_nav_bar.dart';

class Politicas_uso extends StatelessWidget {
  const Politicas_uso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text('Políticas de Uso',
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
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan( text: 'Termos de uso ', style: GoogleFonts.poppins( fontSize: 23, color: Colors.orangeAccent),
                ),
              ),
              const SizedBox(height: 15,),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan( text: 'Por meio do presente instrumento, são estabelecidos os termos e as condições gerais para a prestação de serviços (as “Condições Gerais”), os quais ficam incorporados, para todos os fins e efeitos, ao formulário de contratação do iFood (o “Formulário” e, emconjunto com a Condições Gerais, o “Contrato”). ',
                  style: GoogleFonts.poppins( fontSize: 16, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 30,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan( text: 'Definições ', style: GoogleFonts.poppins( fontSize: 23, color: Colors.orangeAccent),
                ),
              ),
              const SizedBox(height: 15,),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan( text: '1.1.Os termos e as expressões abaixo, quando iniciados em letra maiúscula nestes Termos e Condições ou no Contrato, no singular ou no plural, no masculino ou no feminino, terão os significados que lhes são indicados ao longo do Contrato ou abaixo: “Colaboradores” significa os funcionários e/ou colaboradores da Empresa que poderão utilizar o Benefício.“Contas” significa as contas individuais e pessoais de cada um dos Colaboradores na Plataforma iFood.“Pedidos” significa os pedidos de delivery do gênero de comidas e bebidas comercializados pelo Restaurante.“Plataforma iFood” significa todos e quaisquer websites e aplicativos para celulares de titularidade do iFood, por meio dos quais, dentre outras funcionalidades, (a) o Restaurante, de um lado, pode ofertar os produtos do seu cardápio aos Clientes Finais, e (b) os Clientes Finais, de outro lado, podem fazer pedidos de entrega de tais produtos aos Restaurantes.“Pedidos” significam os pedidos de entrega de gêneros alimentícios e bebidas realizados pelos clientes finais aos Restaurantes por meio da Plataforma iFood.“Remuneração” significa o valor devido por mês, em decorrência da prestação dos Serviços e do licenciamento do Software.“Restaurantes” significa restaurantes, bares, padarias e outros estabelecimentos similares.“Serviços” significa os serviços de controle de despesas realizadas pelos Colaboradores por meio da Plataforma iFood, a coleta e interpretação dos dados referentes às referidas despesas e aos Pedidos por eles realizados.“Software” significa o software chamado “iFood para Empresas”.',
                  style: GoogleFonts.poppins( fontSize: 16, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}