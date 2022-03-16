import 'package:dartz/dartz.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/home/domain/entities/invader.dart';

abstract class InvaderRepository {
  Future<Either<Failure, Invader>> getInvader(int id);
  Future<Either<Failure, List<Invader>>> getInvaders();
}
