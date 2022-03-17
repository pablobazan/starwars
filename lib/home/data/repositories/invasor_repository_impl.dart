import 'package:dartz/dartz.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/core/platform/api_network.dart';
import 'package:starwars/home/data/data_sources/invasor_data_source.dart';
import 'package:starwars/home/data/models/invader_model.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class InvaderRepositoryImp extends InvaderRepository {
  final InvasorDataSource invasorDataSource;

  InvaderRepositoryImp({required this.invasorDataSource});

  @override
  Future<Either<Failure, Invader>> getInvader(int id) async {
    return ApiNetwork.call<InvaderModel>(
        () async => await invasorDataSource.getInvader(id));
  }

  @override
  Future<Either<Failure, List<Invader>>> getInvaders() async {
    return ApiNetwork.call<List<InvaderModel>>(
        () async => await invasorDataSource.getInvaders());
  }
}
