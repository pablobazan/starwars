import 'package:equatable/equatable.dart';

class InvaderList extends Equatable {
  final num count;
  final String? next;
  final String? previous;
  final List<Invader> invaders;

  const InvaderList(
      {required this.count, this.next, this.previous, required this.invaders});

  copyWith({
    num? count,
    String? next,
    String? previous,
    List<Invader>? invaders,
  }) {
    return InvaderList(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      invaders: invaders ?? this.invaders,
    );
  }

  @override
  List<Object> get props => [count, invaders];
}

class Invader extends Equatable {
  const Invader({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String> films;
  final List<dynamic> species;
  final List<String> vehicles;
  final List<String> starships;
  final String created;
  final String edited;
  final String url;

  @override
  List<Object?> get props =>
      [name, height, mass, hairColor, skinColor, eyeColor];
}
