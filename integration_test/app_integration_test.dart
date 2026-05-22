import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_mobile_test/app.dart';
import 'package:nubank_mobile_test/core/constants/app_strings.dart';
import 'package:nubank_mobile_test/core/errors/failure.dart';
import 'package:nubank_mobile_test/core/errors/result.dart';
import 'package:nubank_mobile_test/core/providers/shared_preferences_provider.dart';
import 'package:nubank_mobile_test/features/home/domain/entities/link_entity.dart';
import 'package:nubank_mobile_test/features/home/domain/usecases/shorten_link_usecase.dart';
import 'package:nubank_mobile_test/features/home/presentation/providers/shorten_link_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockShortenLinkUseCase extends Mock implements ShortenLinkUseCase {}

const _tUrl = 'https://google.com';
const _tAlias = 'abc123';
const _tShortUrl =
    'https://url-shortener-server.onrender.com/api/alias/$_tAlias';
const _tLink = LinkEntity(
  alias: _tAlias,
  originalUrl: _tUrl,
  shortUrl: _tShortUrl,
);
const _tSiteName = 'GOOGLE';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockShortenLinkUseCase mockUseCase;
  late SharedPreferences sharedPrefs;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPrefs = await SharedPreferences.getInstance();
    registerFallbackValue(
      const LinkEntity(alias: '', originalUrl: '', shortUrl: ''),
    );
  });

  setUp(() {
    mockUseCase = MockShortenLinkUseCase();
    sharedPrefs.clear();
  });

  Widget buildApp() {
    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
        shortenLinkUseCaseProvider.overrideWithValue(mockUseCase),
      ],
      child: const LinkShortenerApp(),
    );
  }

  Future<void> waitForHome(WidgetTester tester) async {
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  }

  Future<void> shortenUrl(WidgetTester tester, String url) async {
    await tester.enterText(find.byType(TextField).first, url);
    await tester.pump();
    await tester.tap(find.text(AppStrings.shortenButton).first);
    await tester.pumpAndSettle();
  }

  testWidgets(
    'should display shortened link in history after submitting valid URL',
    (tester) async {
      when(
        () => mockUseCase.execute(any()),
      ).thenAnswer((_) async => const Result.success(_tLink));

      await tester.pumpWidget(buildApp());
      await waitForHome(tester);
      expect(find.text(AppStrings.historyEmpty), findsOneWidget);

      await shortenUrl(tester, _tUrl);

      expect(find.text(_tSiteName), findsOneWidget);
      expect(find.text(_tShortUrl), findsOneWidget);
      expect(find.text(AppStrings.historyEmpty), findsNothing);
    },
  );

  testWidgets('should show error snackbar when submitting an invalid URL', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());
    await waitForHome(tester);

    await shortenUrl(tester, 'this is not a url');

    expect(find.text(AppStrings.errorInvalidUrl), findsOneWidget);
    verifyNever(() => mockUseCase.execute(any()));
  });

  testWidgets('should show network error message when API call fails', (
    tester,
  ) async {
    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.failure(Failure.network()));

    await tester.pumpWidget(buildApp());
    await waitForHome(tester);

    await shortenUrl(tester, _tUrl);

    expect(find.text(AppStrings.errorNoInternet), findsOneWidget);
    expect(find.text(AppStrings.historyEmpty), findsOneWidget);
  });

  testWidgets('should remove link from history when delete button is pressed', (
    tester,
  ) async {
    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.success(_tLink));

    await tester.pumpWidget(buildApp());
    await waitForHome(tester);
    await shortenUrl(tester, _tUrl);
    expect(find.text(_tSiteName), findsOneWidget);

    // LinkHistoryCard renders Icons.delete_outline for the delete action
    final deleteButton = find.byIcon(Icons.delete_outline);
    expect(deleteButton, findsOneWidget);
    await tester.tap(deleteButton);
    await tester.pumpAndSettle();

    expect(find.text(_tSiteName), findsNothing);
    expect(find.text(AppStrings.historyEmpty), findsOneWidget);
  });

  testWidgets('should clear all history when clear button is pressed', (
    tester,
  ) async {
    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.success(_tLink));

    await tester.pumpWidget(buildApp());
    await waitForHome(tester);
    await shortenUrl(tester, _tUrl);
    expect(find.text(_tSiteName), findsOneWidget);

    final clearButton = find.text(AppStrings.historyClear);
    expect(clearButton, findsOneWidget);
    await tester.tap(clearButton);
    await tester.pumpAndSettle();

    expect(find.text(_tSiteName), findsNothing);
    expect(find.text(AppStrings.historyEmpty), findsOneWidget);
  });

  testWidgets('should persist history after app restart', (tester) async {
    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.success(_tLink));

    await tester.pumpWidget(buildApp());
    await waitForHome(tester);
    await shortenUrl(tester, _tUrl);
    expect(find.text(_tSiteName), findsOneWidget);

    // Simulate restart: same sharedPrefs instance keeps the saved data
    await tester.pumpWidget(buildApp());
    await waitForHome(tester);

    expect(find.text(_tSiteName), findsOneWidget);
    expect(find.text(_tShortUrl), findsOneWidget);
  });

  testWidgets('should show confirmation snackbar when copy button is pressed', (
    tester,
  ) async {
    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.success(_tLink));

    await tester.pumpWidget(buildApp());
    await waitForHome(tester);
    await shortenUrl(tester, _tUrl);

    // LinkActions renders Icons.copy_all_outlined (NOT Icons.copy_outlined)
    final copyButton = find.byIcon(Icons.copy_all_outlined);
    expect(copyButton, findsOneWidget);
    await tester.tap(copyButton);
    await tester.pump();

    expect(find.text(AppStrings.copySuccess), findsOneWidget);
  });

  testWidgets('should not duplicate a link with the same alias in history', (
    tester,
  ) async {
    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.success(_tLink));

    await tester.pumpWidget(buildApp());
    await waitForHome(tester);

    await shortenUrl(tester, _tUrl);
    await shortenUrl(tester, _tUrl);

    expect(find.text(_tSiteName), findsOneWidget);
  });
}
