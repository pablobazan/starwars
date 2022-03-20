import 'package:starwars/home/data/models/invader_model.dart';
import 'package:starwars/home/data/models/invader_report_model.dart';
import 'dart:convert';

import '../fixtures/fixture_reader.dart';

class TestUtils {
  static const int invaderId = 1;
  static const int userId = 1;
  static const String dateTime = '2020-01-01T00:00:00.000Z';
  static const String characterName = 'Luke Skywalker';

  static InvaderListModel getInvaders() {
    var invadersJson = json.decode(fixtureInvader('invaders.json'));
    return InvaderListModel.fromJson(invadersJson);
  }

  static InvaderModel getInvader() {
    var invaderJson = json.decode(fixtureInvader('invader.json'));
    return InvaderModel.fromJson(invaderJson);
  }

  static InvaderReportModel postInvaderReport() {
    var invaderReportJson = json.decode(fixtureInvader('invader_report.json'));
    return InvaderReportModel.fromJson(invaderReportJson);
  }
}
