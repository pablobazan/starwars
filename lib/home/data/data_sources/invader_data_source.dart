import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/home/data/models/invader_model.dart';
import 'package:starwars/home/data/models/invader_report_model.dart';

abstract class InvaderDataSource {
  Future<InvaderModel> getInvader(int id);

  Future<InvaderListModel> getInvaders(int page);

  Future<InvaderReportModel> postInvaderReport(
      {int? id,
      required int userId,
      required String dateTime,
      required String characterName});
}

class InvaderDataSourceImpl implements InvaderDataSource {
  final HttpClient client;

  InvaderDataSourceImpl({required this.client});

  @override
  Future<InvaderModel> getInvader(int id) async {
    final response = await client.get('https://swapi.dev/api/people/$id/');
    final result = response.data;

    return InvaderModel.fromJson(result);
  }

  @override
  Future<InvaderListModel> getInvaders(int page) async {
    final response =
        await client.get('https://swapi.dev/api/people/?page=$page');
    final result = response.data;

    return InvaderListModel.fromJson(result);
  }

  @override
  Future<InvaderReportModel> postInvaderReport(
      {int? id,
      required int userId,
      required String dateTime,
      required String characterName}) async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final report = InvaderReportModel(
            userId: userId, dateTime: dateTime, characterName: characterName)
        .toJson();
    final response = await client.post(url, report);

    return InvaderReportModel.fromJson(response.data);
  }
}
