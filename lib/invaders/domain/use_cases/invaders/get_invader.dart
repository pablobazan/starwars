import 'package:dartz/dartz.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/invaders/domain/entities/invader.dart';
import 'package:starwars/invaders/domain/repositories/invader_repository.dart';

class GetInvader {
  final InvaderRepository repository;

  GetInvader(this.repository);

  Future<Either<Failure, Invader>> call(int id) async {
    return await repository.getInvader(id);
  }
}
