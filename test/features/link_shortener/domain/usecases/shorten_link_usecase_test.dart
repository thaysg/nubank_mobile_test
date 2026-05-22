import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_mobile_test/core/errors/failure.dart';
import 'package:nubank_mobile_test/core/errors/result.dart';
import 'package:nubank_mobile_test/features/home/domain/entities/link_entity.dart';
import 'package:nubank_mobile_test/features/home/domain/repositories/link_repository.dart';
import 'package:nubank_mobile_test/features/home/domain/usecases/shorten_link_usecase.dart';

class MockLinkRepository extends Mock implements LinkRepository {}

void main() {
  late ShortenLinkUseCase useCase;
  late MockLinkRepository mockRepository;

  setUp(() {
    mockRepository = MockLinkRepository();
    useCase = ShortenLinkUseCase(mockRepository);
  });

  const tUrl = 'https://google.com';
  const tLinkEntity = LinkEntity(
    alias: 'abc',
    originalUrl: tUrl,
    shortUrl: 'https://short.com/abc',
  );

  test('should return LinkEntity on success', () async {
    // arrange
    when(
      () => mockRepository.shortenLink(any()),
    ).thenAnswer((_) async => const Result.success(tLinkEntity));

    // act
    final result = await useCase.execute(tUrl);

    // assert
    expect(result, const Result.success(tLinkEntity));
    verify(() => mockRepository.shortenLink(tUrl)).called(1);
  });

  test('should return Failure on repository error', () async {
    // arrange
    const tFailure = Failure.network();
    when(
      () => mockRepository.shortenLink(any()),
    ).thenAnswer((_) async => const Result.failure(tFailure));

    // act
    final result = await useCase.execute(tUrl);

    // assert
    expect(result, const Result<LinkEntity>.failure(tFailure));
    verify(() => mockRepository.shortenLink(tUrl)).called(1);
  });
}
