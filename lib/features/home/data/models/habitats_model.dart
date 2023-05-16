import '../../domain/entities/habitats.dart';

class HabitatsModel extends Habitats {
  const HabitatsModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.habitats,
  });

  factory HabitatsModel.fromJson(Map<String, dynamic> json) => HabitatsModel(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        habitats: json['habitats'],
      );
}

class HabitatModel extends Habitat {
  const HabitatModel({
    required super.name,
    required super.url,
  });

  factory HabitatModel.fromJson(Map<String, dynamic> json) => HabitatModel(
        name: json['name'],
        url: json['url'],
      );
}
