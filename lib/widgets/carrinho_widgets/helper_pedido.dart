class Pedido {
  String idLoja;
  List carrinho;
  num valorTotal;
  String pagamento;
  String endereco;

  Pedido({required this.idLoja, required this.carrinho, required this.endereco, required this.pagamento, required this.valorTotal});

  Map<String, dynamic> toJson() => {
    'idLoja': idLoja,
    'Carrinho': carrinho,
    'valorTotal': valorTotal,
    'pagamento': pagamento,
    'endereco': endereco
  };
}