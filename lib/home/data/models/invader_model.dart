import 'package:starwars/home/domain/entities/invader.dart';

class InvaderListModel extends InvaderList {
  const InvaderListModel(
      {required num count,
      required String? next,
      required String? previous,
      required List<InvaderModel> invaders})
      : super(count: count, next: next, previous: previous, invaders: invaders);

  factory InvaderListModel.fromJson(Map<String, dynamic> json) {
    return InvaderListModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      invaders: (json['results'] as List)
          .map((e) => InvaderModel.fromJson(e))
          .toList(),
    );
  }
}

class InvaderModel extends Invader {
  const InvaderModel({
    required String name,
    required String height,
    required String mass,
    required String hairColor,
    required String skinColor,
    required String eyeColor,
    required String birthYear,
    required String gender,
    required String homeworld,
    required List<String> films,
    required List<dynamic> species,
    required List<String> vehicles,
    required List<String> starships,
    required String created,
    required String edited,
    required String url,
  }) : super(
            name: name,
            height: height,
            mass: mass,
            hairColor: hairColor,
            skinColor: skinColor,
            eyeColor: eyeColor,
            birthYear: birthYear,
            gender: gender,
            homeworld: homeworld,
            films: films,
            species: species,
            vehicles: vehicles,
            starships: starships,
            created: created,
            edited: edited,
            url: url);

  factory InvaderModel.fromJson(Map<String, dynamic> json) => InvaderModel(
        name: json['name'],
        height: json['height'],
        mass: json['mass'],
        hairColor: json['hair_color'],
        skinColor: json['skin_color'],
        eyeColor: json['eye_color'],
        birthYear: json['birth_year'],
        gender: json['gender'],
        homeworld: json['homeworld'],
        films: (json['films'] as List<dynamic>).cast<String>(),
        species: (json['species'] as List<dynamic>).cast<String>(),
        vehicles: (json['vehicles'] as List<dynamic>).cast<String>(),
        starships: (json['starships'] as List<dynamic>).cast<String>(),
        created: json['created'],
        edited: json['edited'],
        url: json['url'],
      );
}
