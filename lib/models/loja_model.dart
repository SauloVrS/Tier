import 'package:tier/models/produto_model.dart';

class ModelLoja {

  String emailDonoLoja;
  String senhaLoja;
  String nomeLoja;
  String logoLoja;
  String enderecoLoja;
  num avaliacao;
  List<ModelProduto>? produtos;
  num pedidoMin;
  String tipoDeServico;
  bool situacao;

  ModelLoja({required this.emailDonoLoja, required this.senhaLoja, required this.nomeLoja, required this.logoLoja, required this.enderecoLoja, required this.avaliacao, this.produtos, required this.pedidoMin, required this.tipoDeServico, required this.situacao});

}
