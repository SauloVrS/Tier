class ModelUsers {
  final String? descricaoUsuario;
  final String? fotoUsuario;
  final String? nomeUsuario;
  final String? enderecoUsuario; //mudar de string p matriz


  ModelUsers({
    required this.descricaoUsuario,
    required this.fotoUsuario,
    required this.nomeUsuario,
    required this.enderecoUsuario,

  });

  Map<String, dynamic> toJson() => {
    'descricaoUsuario' : descricaoUsuario,
    'fotoUsuario': fotoUsuario,
    'nomeUsuario' : nomeUsuario,
    'enderecoUsuario' : enderecoUsuario


  };

  static ModelUsers fromJson(Map<String, dynamic> json) => ModelUsers(
      descricaoUsuario: json['descricaoUsuario'],
      fotoUsuario: json['fotoUsuario'],
      nomeUsuario: json['nomeUsuario'],
      enderecoUsuario: json['enderecoUsuario'],
  );
}