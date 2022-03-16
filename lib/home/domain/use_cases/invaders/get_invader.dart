import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/core/use_cases/use_cases.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class GetInvader extends UseCase<Invader, Params> {
  final InvaderRepository repository;

  GetInvader(this.repository);

  @override
  Future<Either<Failure, Invader>> call(Params params) async {
    return await repository.getInvader(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params(this.id);

  @override
  List<Object?> get props => [id];
}
