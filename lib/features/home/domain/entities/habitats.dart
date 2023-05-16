import 'package:equatable/equatable.dart';

class Habitats extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<Habitat> habitats;

  const Habitats({
    required this.count,
    required this.next,
    required this.previous,
    required this.habitats,
  });

  @override
  List<Object?> get props => [count, next, previous, habitats];
}

class Habitat extends Equatable {
  final String name;
  final String url;

  const Habitat({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [name, url];
}
