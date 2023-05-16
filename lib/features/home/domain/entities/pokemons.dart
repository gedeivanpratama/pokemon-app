import 'package:equatable/equatable.dart';

class Pokemons extends Equatable {
  final int itemCount;
  final String? next;
  final String? previous;
  final List<Pokemon> pokemons;

  const Pokemons({
    required this.itemCount,
    required this.next,
    required this.pokemons,
    required this.previous,
  });

  @override
  List<Object?> get props => [itemCount, next, previous, pokemons];
}

class Pokemon extends Equatable {
  final String image;
  final String name;

  const Pokemon({
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [image, name];
}
