class ModelPet {
  final String? descricaoPet;
  final String? distancia;
  final String? fotoPet;
  final String? generoPet;
  final String? idadePet;
  final String? nomePet;

  //int? favorite;

  final String? typePet;

  ModelPet({
    required this.descricaoPet,
    required this.distancia,
    required this.fotoPet,
    required this.generoPet,
    required this.idadePet,
    required this.nomePet,
    required this.typePet,

  });

  Map<String, dynamic> toJson() => {
    'descricaoPet' : descricaoPet,
    'distancia' : distancia,
    'fotoPet' : fotoPet,
    'generoPet' : generoPet,
    'idadePet' : idadePet,
    'nomePet' : nomePet,
    'typePet' : typePet,

  };

  static ModelPet fromJson(Map<String, dynamic> json) => ModelPet(
      descricaoPet: json['descricaoPet'],
      distancia: json['distancia'],
      fotoPet: json['fotoPet'],
      generoPet: json['generoPet'],
      idadePet:  json['idadePet'],
      nomePet: json['nomePet'],
      typePet: json['typePet']
  );
}