class ModelProduto {

  String nomeProduto;
  String fotoProduto;
  num preco;
  bool promocao;
  num? novoPreco;
  bool esgotado;

  ModelProduto({required this.nomeProduto, required this.fotoProduto, required this.preco, required this.promocao, this.novoPreco, required this.esgotado});

}