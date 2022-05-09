class ModelPet {
  final String? descricao_doador;
  final String? descricao_pet;
  final String? distancia;
  final String? foto_pet;
  final String? foto_doador;
  final String? genero;
  final String? idade;
  final String? nome_doador;
  final String? nome_pet;

  //int? favorite;

  final String? typePet;

  ModelPet({
    required this.descricao_doador,
    required this.descricao_pet,
    required this.distancia,
    required this.foto_doador,
    required this.foto_pet,
    required this.genero,
    required this.idade,
    required this.nome_doador,
    required this.nome_pet,
    required this.typePet,
    //required this.favorite,
    //required this.dog,
    //required this.cat,
    // required this.mouse,
    // required this.bird,
  });
}