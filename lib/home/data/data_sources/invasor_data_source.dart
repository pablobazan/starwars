import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/home/data/models/invader_model.dart';

abstract class InvasorDataSource {
  Future<InvaderModel> getInvader(int id);

  Future<List<InvaderModel>> getInvaders();
}

class InvasorDataSourceImpl implements InvasorDataSource {
  final HttpClient client;

  InvasorDataSourceImpl(this.client);

  @override
  Future<InvaderModel> getInvader(int id) async {
    final response = await client.get('/people/$id/');
    final result = response.data;

    return InvaderModel.fromJson(result);
  }

  @override
  Future<List<InvaderModel>> getInvaders() async {
    final response = await client.get('/people/');
    final result = response.data['results'] as List;

    return result.map((e) => InvaderModel.fromJson(e)).toList();
  }
}
