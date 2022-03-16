import 'package:dartz/dartz.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/core/use_cases/use_cases.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class GetInvader extends UseCase<List<Invader>, NoParams> {
  final InvaderRepository repository;

  GetInvader(this.repository);

  @override
  Future<Either<Failure, List<Invader>>> call(NoParams params) async {
    return await repository.getInvaders();
  }
}
