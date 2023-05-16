import '../../../../core/utility/extensions.dart';
import '../../domain/entities/pokemons.dart';

class PokemonsModel extends Pokemons {
  const PokemonsModel({
    required super.itemCount,
    required super.next,
    required super.pokemons,
    required super.previous,
  });

  factory PokemonsModel.fromJson(Map<String, dynamic> json) => PokemonsModel(
        itemCount: json['count'],
        next: json['next'],
        pokemons: (json['results'] as List<dynamic>)
            .map((e) => PokemonModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        previous: json['previous'],
      );
}

class PokemonModel extends Pokemon {
  const PokemonModel({
    required super.image,
    required super.name,
  });
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      image: (json['url'] as String).toImageUrl(),
      name: json['name'],
    );
  }
}
