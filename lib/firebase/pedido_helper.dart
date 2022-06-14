enum Status {
  andamento,
  caminho,
  concluido
}

class Pedido {
  List? carrinho;
  String? idUser;
  String? idLoja;
  String? pagamento;
  num? valor;
  //String pontos;
  Endereco? endereco;
  Status? status;

  Pedido({
    this.carrinho,
    this.idUser,
    this.idLoja,
    this.pagamento,
    this.valor,
    this.endereco
  });

  Map<String, dynamic> toJson() => {
    'carrinho': carrinho,
    'idUser': idUser,
    'idLoja': idLoja,
    'pagamento': pagamento,
    'valor': valor,
    'endereço': endereco
  };
}

class Endereco {
  String bairro;
  String cidade;
  String rua;
  int numero;
  String cep;

  Endereco({
    required this.cidade,
    required this.bairro,
    required this.cep,
    required this.numero,
    required this.rua
  });
}