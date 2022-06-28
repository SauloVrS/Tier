
import 'package:tier/widgets/carrinho_widgets/carrinho_functions.dart';

class Pedido {
  List? carrinho;
  String? idUser;
  String? idLoja;
  String? pagamento;
  num? valor;
  //String pontos;
  Endereco? endereco;
  String? status;

  Pedido({
    this.carrinho,
    this.idUser,
    this.idLoja,
    this.pagamento,
    this.valor,
    this.endereco,
    this.status
  });

  Map<String, dynamic> toJson() => {
    'carrinho': carrinho,
    'idUser': idUser,
    'idLoja': idLoja,
    'pagamento': pagamento,
    'valor': valor,
    'endereco': endereco!.toJson(),
    'status': status
  };

  static Pedido fromJson(Map<String, dynamic> json) => Pedido(
    carrinho: json['carrinho'],
    idUser: json['idUser'],
    idLoja: json['idLoja'],
    pagamento: json['pagamento'],
    valor: json['valor'],
    endereco: Endereco.fromJson(json['endereco']),
    status: json['status']
  );
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

  Map<String, dynamic> toJson() => {
    'bairro': bairro,
    'cidade': cidade,
    'rua': rua,
    'numero': numero,
    'cep': cep
  };

  static Endereco fromJson(Map<String, dynamic> json) => Endereco(
    bairro: json['bairro'],
    cidade: json['cidade'],
    rua: json['rua'],
    numero: json['numero'],
    cep: json['cep'],
  );
}