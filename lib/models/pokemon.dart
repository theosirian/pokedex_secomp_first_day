class PokemonModel {
  final int id;
  final String name;
  final String sprite;
  final double weight;
  final double height;

  PokemonModel({
    this.id,
    this.name,
    this.sprite,
    this.weight,
    this.height,
  });

  factory PokemonModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      PokemonModel(
        id: json['id'],
        name: json['name'],
        sprite: json['sprites']['front_default'],
        weight: json['weight'] / 10.0,
        height: json['height'] * 10.0,
      );
}
