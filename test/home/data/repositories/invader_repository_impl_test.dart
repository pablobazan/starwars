import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars/core/error/exceptions.dart';
import 'package:starwars/core/error/failures.dart';
import 'package:starwars/home/data/data_sources/invader_data_source.dart';
import 'package:starwars/home/data/repositories/invader_repository_impl.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

import '../../../core/test_utils.dart';
import 'invader_repository_impl_test.mocks.dart';

@GenerateMocks([InvaderDataSource])
void main() {
  late MockInvaderDataSource mockInvaderDataSource;
  late InvaderRepository invaderRepository;

  setUp(() {
    mockInvaderDataSource = MockInvaderDataSource();
    invaderRepository =
        InvaderRepositoryImp(invasorDataSource: mockInvaderDataSource);
  });

  group('Invaders repository test', (() {
    test('should execute a get invaders and return a list of invaders model',
        () async {
      when(mockInvaderDataSource.getInvaders(TestUtils.invaderId))
          .thenAnswer((_) async => TestUtils.getInvaders());

      final result = await invaderRepository.getInvaders(TestUtils.invaderId);

      expect(result, Right(TestUtils.getInvaders()));
    });

    test('should execute a get invaders and return a server exception',
        () async {
      when(mockInvaderDataSource.getInvaders(TestUtils.invaderId))
          .thenThrow((_) async => const ServerException(''));

      final result = await invaderRepository.getInvaders(TestUtils.invaderId);

      expect(result, Left(ServerFailure()));
    });

    test('should execute a get invader and return a invader model', () async {
      when(mockInvaderDataSource.getInvader(TestUtils.invaderId))
          .thenAnswer((_) async => TestUtils.getInvader());

      final result = await invaderRepository.getInvader(TestUtils.invaderId);

      expect(result, Right(TestUtils.getInvader()));
    });

    test('should execute a get invader and return a server exception',
        () async {
      when(mockInvaderDataSource.getInvader(TestUtils.invaderId))
          .thenThrow((_) async => const ServerException(''));

      final result = await invaderRepository.getInvader(TestUtils.invaderId);

      expect(result, Left(ServerFailure()));
    });

    test('should execute a post invader report and return a invader model',
        () async {
      when(mockInvaderDataSource.postInvaderReport(
              userId: TestUtils.userId,
              dateTime: TestUtils.dateTime,
              characterName: TestUtils.characterName))
          .thenAnswer((_) async => TestUtils.postInvaderReport());

      final result = await invaderRepository.postInvaderReport(
          userId: TestUtils.userId,
          dateTime: TestUtils.dateTime,
          characterName: TestUtils.characterName);

      expect(result, Right(TestUtils.postInvaderReport()));
    });

    test('should execute a post invader report and return a server exception',
        () async {
      when(mockInvaderDataSource.postInvaderReport(
              userId: TestUtils.userId,
              dateTime: TestUtils.dateTime,
              characterName: TestUtils.characterName))
          .thenThrow((_) async => const ServerException(''));

      final result = await invaderRepository.postInvaderReport(
          userId: TestUtils.userId,
          dateTime: TestUtils.dateTime,
          characterName: TestUtils.characterName);

      expect(result, Left(ServerFailure()));
    });
  }));
}
