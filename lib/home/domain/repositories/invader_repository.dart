import 'package:dartz/dartz.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/entities/report_invader.dart';

abstract class InvaderRepository {
  Future<Either<Failure, Invader>> getInvader(int id);
  Future<Either<Failure, InvaderList>> getInvaders(int page);
  Future<Either<Failure, InvaderReport>> postInvaderReport(
      {required int userId,
      required String dateTime,
      required String characterName});
}

  // @override
  // Future<Either<Failure, InvaderReport>> postInvaderReport(
  //     int userId, String dateTime, String characterName) async {
  //   return ApiNetwork.call<InvaderReport>(() async =>
  //       await invasorDataSource.postInvaderReport(
  //           userId: userId, dateTime: dateTime, characterName: characterName));
  // }