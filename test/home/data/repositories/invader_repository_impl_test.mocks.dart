// Mocks generated by Mockito 5.1.0 from annotations
// in starwars/test/home/data/repositories/invader_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:starwars/home/data/data_sources/invader_data_source.dart'
    as _i4;
import 'package:starwars/home/data/models/invader_model.dart' as _i2;
import 'package:starwars/home/data/models/invader_report_model.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeInvaderModel_0 extends _i1.Fake implements _i2.InvaderModel {}

class _FakeInvaderListModel_1 extends _i1.Fake implements _i2.InvaderListModel {
}

class _FakeInvaderReportModel_2 extends _i1.Fake
    implements _i3.InvaderReportModel {}

/// A class which mocks [InvaderDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockInvaderDataSource extends _i1.Mock implements _i4.InvaderDataSource {
  MockInvaderDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.InvaderModel> getInvader(int? id) => (super.noSuchMethod(
          Invocation.method(#getInvader, [id]),
          returnValue: Future<_i2.InvaderModel>.value(_FakeInvaderModel_0()))
      as _i5.Future<_i2.InvaderModel>);
  @override
  _i5.Future<_i2.InvaderListModel> getInvaders(int? page) =>
      (super.noSuchMethod(Invocation.method(#getInvaders, [page]),
              returnValue:
                  Future<_i2.InvaderListModel>.value(_FakeInvaderListModel_1()))
          as _i5.Future<_i2.InvaderListModel>);
  @override
  _i5.Future<_i3.InvaderReportModel> postInvaderReport(
          {int? id, int? userId, String? dateTime, String? characterName}) =>
      (super.noSuchMethod(
              Invocation.method(#postInvaderReport, [], {
                #id: id,
                #userId: userId,
                #dateTime: dateTime,
                #characterName: characterName
              }),
              returnValue: Future<_i3.InvaderReportModel>.value(
                  _FakeInvaderReportModel_2()))
          as _i5.Future<_i3.InvaderReportModel>);
}
