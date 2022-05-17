class ModelPet {
  final String? descricaoDoador;
  final String? descricaoPet;
  final String? distancia;
  final String? fotoPet;
  final String? fotoDoador;
  final String? generoPet;
  final String? idadePet;
  final String? nomeDoador;
  final String? nomePet;

  //int? favorite;

  final String? typePet;

  ModelPet({
    required this.descricaoDoador,
    required this.descricaoPet,
    required this.distancia,
    required this.fotoDoador,
    required this.fotoPet,
    required this.generoPet,
    required this.idadePet,
    required this.nomeDoador,
    required this.nomePet,
    required this.typePet,
    //required this.favorite,
    //required this.dog,
    //required this.cat,
    // required this.mouse,
    // required this.bird,
  });

  Map<String, dynamic> toJson() => {
    "descricaoDoador" : descricaoDoador,
    "descricaoPet" : descricaoPet,
    "distancia" : distancia,
    "fotoDoador" : fotoDoador,


  };
}