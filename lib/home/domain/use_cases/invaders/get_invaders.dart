import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/core/use_cases/use_cases.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class GetInvaders extends UseCase<InvaderList, Params> {
  final InvaderRepository repository;

  GetInvaders({required this.repository});

  @override
  Future<Either<Failure, InvaderList>> call(Params params) async {
    return await repository.getInvaders(params.page);
  }
}

class Params extends Equatable {
  final int page;

  const Params({required this.page});

  @override
  List<Object?> get props => [page];
}
