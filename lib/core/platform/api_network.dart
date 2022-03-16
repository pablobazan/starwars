import 'package:dartz/dartz.dart';
import 'package:starwars/core/error/exceptions.dart';
import 'package:starwars/core/error/failures.dart';

class ApiNetwork {
  static Future<Either<Failure, T>> call<T>(Function() function) async {
    try {
      T result = await function();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
