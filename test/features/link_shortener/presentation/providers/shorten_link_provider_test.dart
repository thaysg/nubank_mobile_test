import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_mobile_test/core/errors/failure.dart';
import 'package:nubank_mobile_test/core/errors/result.dart';
import 'package:nubank_mobile_test/core/providers/shared_preferences_provider.dart';
import 'package:nubank_mobile_test/features/home/domain/entities/link_entity.dart';
import 'package:nubank_mobile_test/features/home/domain/usecases/shorten_link_usecase.dart';
import 'package:nubank_mobile_test/features/home/presentation/providers/shorten_link_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockShortenLinkUseCase extends Mock implements ShortenLinkUseCase {}

void main() {
  late MockShortenLinkUseCase mockUseCase;
  late SharedPreferences sharedPrefs;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPrefs = await SharedPreferences.getInstance();
  });

  setUp(() {
    mockUseCase = MockShortenLinkUseCase();
  });

  ProviderContainer createContainer() {
    final container = ProviderContainer(
      overrides: [
        shortenLinkUseCaseProvider.overrideWithValue(mockUseCase),
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  const tUrl = 'https://google.com';
  const tLinkEntity = LinkEntity(
    alias: 'abc',
    originalUrl: tUrl,
    shortUrl: 'https://short.com/abc',
  );

  group('ShortenLinkProvider', () {
    test('initial state should be AsyncData(null)', () {
      final container = createContainer();
      final state = container.read(shortenLinkProvider);

      expect(state, const AsyncData<void>(null));
    });

    test('should emit AsyncLoading then AsyncData on success', () async {
      final container = createContainer();
      
      when(() => mockUseCase.execute(any()))
          .thenAnswer((_) async => const Result.success(tLinkEntity));

      final notifier = container.read(shortenLinkProvider.notifier);
      
      final future = notifier.shorten(tUrl);
      
      expect(container.read(shortenLinkProvider), const AsyncLoading<void>());
      
      await future;
      
      expect(container.read(shortenLinkProvider), const AsyncData<void>(null));
    });

    test('should emit AsyncError on failure', () async {
      final container = createContainer();
      const tFailure = Failure.network();
      
      when(() => mockUseCase.execute(any()))
          .thenAnswer((_) async => const Result.failure(tFailure));

      final notifier = container.read(shortenLinkProvider.notifier);
      
      final future = notifier.shorten(tUrl);
      
      expect(container.read(shortenLinkProvider), const AsyncLoading<void>());
      
      await future;
      
      final state = container.read(shortenLinkProvider);
      expect(state, isA<AsyncError>());
      expect(state.error, tFailure);
    });
  });
}
