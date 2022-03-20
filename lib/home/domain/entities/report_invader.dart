import 'package:equatable/equatable.dart';

class InvaderReport extends Equatable {
  final int? id;
  final int userId;
  final String dateTime;
  final String characterName;

  const InvaderReport(
      {required this.userId,
      required this.dateTime,
      required this.characterName,
      this.id});

  @override
  List<Object> get props => [userId];
}
