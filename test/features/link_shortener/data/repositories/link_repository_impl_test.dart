import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_mobile_test/core/errors/failure.dart';
import 'package:nubank_mobile_test/core/errors/result.dart';
import 'package:nubank_mobile_test/features/home/data/datasources/link_local_datasource.dart';
import 'package:nubank_mobile_test/features/home/data/datasources/link_remote_datasource.dart';
import 'package:nubank_mobile_test/features/home/data/models/link_model.dart';
import 'package:nubank_mobile_test/features/home/data/repositories/link_repository_impl.dart';
import 'package:nubank_mobile_test/features/home/domain/entities/link_entity.dart';

class MockLinkRemoteDataSource extends Mock implements LinkRemoteDataSource {}

class MockLinkLocalDataSource extends Mock implements LinkLocalDataSource {}

void main() {
  late LinkRepositoryImpl repository;
  late MockLinkRemoteDataSource mockRemoteDataSource;
  late MockLinkLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockLinkRemoteDataSource();
    mockLocalDataSource = MockLinkLocalDataSource();
    repository = LinkRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
  });

  const tUrl = 'https://google.com';
  const tLinkModel = LinkModel(
    alias: 'abc',
    links: LinkLinksModel(self: tUrl, short: 'https://short.com/abc'),
  );
  final tLinkEntity = tLinkModel.toEntity();

  group('shortenLink', () {
    test('should return LinkEntity when datasource succeeds', () async {
      // arrange
      when(
        () => mockRemoteDataSource.shortenLink(any()),
      ).thenAnswer((_) async => tLinkModel);

      // act
      final result = await repository.shortenLink(tUrl);

      // assert
      expect(result, Result.success(tLinkEntity));
      verify(() => mockRemoteDataSource.shortenLink(tUrl)).called(1);
    });

    test(
      'should return Failure.network on DioException connection error',
      () async {
        // arrange
        when(() => mockRemoteDataSource.shortenLink(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            type: DioExceptionType.connectionError,
          ),
        );

        // act
        final result = await repository.shortenLink(tUrl);

        // assert
        expect(result, const Result<LinkEntity>.failure(Failure.network()));
      },
    );

    test(
      'should return Failure.network on DioException timeout',
      () async {
        // arrange
        when(() => mockRemoteDataSource.shortenLink(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            type: DioExceptionType.connectionTimeout,
          ),
        );

        // act
        final result = await repository.shortenLink(tUrl);

        // assert
        expect(result, const Result<LinkEntity>.failure(Failure.network()));
      },
    );

    test(
      'should return Failure.notFound on 404',
      () async {
        // arrange
        when(() => mockRemoteDataSource.shortenLink(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 404,
            ),
          ),
        );

        // act
        final result = await repository.shortenLink(tUrl);

        // assert
        expect(result, const Result<LinkEntity>.failure(Failure.notFound()));
      },
    );

    test(
      'should return Failure.serverError on 500',
      () async {
        // arrange
        when(() => mockRemoteDataSource.shortenLink(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 500,
            ),
          ),
        );

        // act
        final result = await repository.shortenLink(tUrl);

        // assert
        expect(
          result,
          const Result<LinkEntity>.failure(Failure.serverError(statusCode: 500)),
        );
      },
    );

    test(
      'should return Failure.unknown on unknown exception',
      () async {
        // arrange
        when(() => mockRemoteDataSource.shortenLink(any())).thenThrow(
          Exception('unknown'),
        );

        // act
        final result = await repository.shortenLink(tUrl);

        // assert
        expect(result, const Result<LinkEntity>.failure(Failure.unknown()));
      },
    );
  });

  group('local storage', () {
    test('should get links from local datasource', () async {
      // arrange
      when(() => mockLocalDataSource.getLinks()).thenAnswer((_) async => [tLinkEntity]);

      // act
      final result = await repository.getLinks();

      // assert
      expect(result, [tLinkEntity]);
      verify(() => mockLocalDataSource.getLinks()).called(1);
    });

    test('should save links to local datasource', () async {
      // arrange
      when(() => mockLocalDataSource.saveLinks(any())).thenAnswer((_) async {});

      // act
      await repository.saveLinks([tLinkEntity]);

      // assert
      verify(() => mockLocalDataSource.saveLinks([tLinkEntity])).called(1);
    });
  });
}
