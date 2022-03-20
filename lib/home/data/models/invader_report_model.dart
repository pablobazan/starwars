import 'package:starwars/home/domain/entities/report_invader.dart';

class InvaderReportModel extends InvaderReport {
  const InvaderReportModel(
      {int? id,
      required int userId,
      required String dateTime,
      required String characterName})
      : super(
            id: id,
            userId: userId,
            dateTime: dateTime,
            characterName: characterName);

  factory InvaderReportModel.fromJson(Map<String, dynamic> json) =>
      InvaderReportModel(
          id: json['id'],
          userId: json['userId'],
          dateTime: json['dateTime'],
          characterName: json['character_name']);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'dateTime': dateTime,
        'character_name': characterName,
      };
}
