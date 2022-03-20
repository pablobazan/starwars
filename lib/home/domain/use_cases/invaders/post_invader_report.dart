import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/core/use_cases/use_cases.dart';
import 'package:starwars/home/domain/entities/report_invader.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class PostInvaderReport extends UseCase<InvaderReport, Params> {
  final InvaderRepository repository;

  PostInvaderReport({required this.repository});

  @override
  Future<Either<Failure, InvaderReport>> call(Params params) async {
    return await repository.postInvaderReport(
        userId: params.userId,
        dateTime: params.dateTime,
        characterName: params.characterName);
  }
}

class Params extends Equatable {
  final int userId;
  final String dateTime;
  final String characterName;

  const Params({
    required this.userId,
    required this.dateTime,
    required this.characterName,
  });

  @override
  List<Object?> get props => [userId];
}
