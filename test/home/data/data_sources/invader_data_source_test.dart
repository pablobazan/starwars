import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/home/data/data_sources/invader_data_source.dart';

import '../../../core/test_utils.dart';
import '../../../fixtures/fixture_reader.dart';

class MockInvaderHttpClient implements HttpClient {
  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    dioAdapter.onGet(path, (request) {
      if (path.contains('people/?page')) {
        request.reply(200, json.decode(fixtureInvader('invaders.json')));
      } else if (path.contains('people')) {
        request.reply(200, json.decode(fixtureInvader('invader.json')));
      }
    });

    return await dio.get(path);
  }

  @override
  Future<Response> post(String path, data) async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
    dioAdapter.onPost(
        path,
        (request) => request.reply(
            200, json.decode(fixtureInvader('invader_report.json'))));
    return await dio.post(path);
  }
}

void main() {
  late InvaderDataSource dataSource;
  late HttpClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockInvaderHttpClient();
    dataSource = InvaderDataSourceImpl(client: mockHttpClient);
  });

  test('should execute a get invaders and return a list of invaders model',
      () async {
    final result = await dataSource.getInvaders(TestUtils.invaderId);

    final expected = TestUtils.getInvaders();
    expect(result, expected);
  });

  test('should execute a get invader and return an invader model', () async {
    final result = await dataSource.getInvader(TestUtils.invaderId);

    expect(result, TestUtils.getInvader());
  });

  test(
      'should execute a post invader report and return an invader report model',
      () async {
    final result = await dataSource.postInvaderReport(
        userId: TestUtils.userId,
        dateTime: TestUtils.dateTime,
        characterName: TestUtils.characterName);

    expect(result, TestUtils.postInvaderReport());
  });
}
