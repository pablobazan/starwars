import 'package:dartz/dartz.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/core/platform/api_network.dart';
import 'package:starwars/home/data/data_sources/invader_data_source.dart';
import 'package:starwars/home/data/models/invader_model.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/entities/report_invader.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class InvaderRepositoryImp extends InvaderRepository {
  final InvaderDataSource invasorDataSource;

  InvaderRepositoryImp({required this.invasorDataSource});

  @override
  Future<Either<Failure, Invader>> getInvader(int id) async {
    return ApiNetwork.call<InvaderModel>(
        () async => await invasorDataSource.getInvader(id));
  }

  @override
  Future<Either<Failure, InvaderList>> getInvaders(int page) async {
    return ApiNetwork.call<InvaderList>(
        () async => await invasorDataSource.getInvaders(page));
  }

  @override
  Future<Either<Failure, InvaderReport>> postInvaderReport(
      {required int userId,
      required String dateTime,
      required String characterName}) async {
    return ApiNetwork.call<InvaderReport>(() async =>
        await invasorDataSource.postInvaderReport(
            userId: userId, dateTime: dateTime, characterName: characterName));
  }
}
