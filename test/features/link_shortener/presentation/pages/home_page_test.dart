import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_mobile_test/core/constants/app_strings.dart';
import 'package:nubank_mobile_test/core/errors/failure.dart';
import 'package:nubank_mobile_test/core/errors/result.dart';
import 'package:nubank_mobile_test/core/providers/shared_preferences_provider.dart';
import 'package:nubank_mobile_test/features/home/domain/entities/link_entity.dart';
import 'package:nubank_mobile_test/features/home/domain/usecases/shorten_link_usecase.dart';
import 'package:nubank_mobile_test/features/home/presentation/pages/home_page.dart';
import 'package:nubank_mobile_test/features/home/presentation/providers/shorten_link_provider.dart';
import 'package:nubank_mobile_test/features/home/presentation/widgets/link_history_card.dart';
import 'package:nubank_mobile_test/features/home/presentation/widgets/shorten_input_card.dart';
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
    sharedPrefs.clear();
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        shortenLinkUseCaseProvider.overrideWithValue(mockUseCase),
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(home: HomePage()),
      ),
    );
  }

  testWidgets('should show initial state correctly', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text(AppStrings.homeTitle), findsAtLeast(1));
    expect(find.byType(ShortenInputCard), findsOneWidget);
    expect(find.text(AppStrings.historyEmpty), findsOneWidget);
  });

  testWidgets('should show link card after shortening', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    const tUrl = 'https://google.com';
    const tLinkEntity = LinkEntity(
      alias: 'abc',
      originalUrl: tUrl,
      shortUrl: 'https://short.com/abc',
    );

    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.success(tLinkEntity));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // Enter URL
    await tester.enterText(find.byType(TextField), tUrl);
    await tester.tap(find.text(AppStrings.shortenButton));

    // Pump until state updates
    await tester.pump(); // Start loading
    await tester.pump(); // Finish loading and update history
    await tester.pumpAndSettle();

    expect(find.byType(LinkHistoryCard), findsOneWidget);
    expect(find.text('GOOGLE'), findsOneWidget);
    expect(find.text('https://short.com/abc'), findsOneWidget);
  });

  testWidgets('should show site name without WWW', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    const tUrl = 'https://www.youtube.com';
    const tLinkEntity = LinkEntity(
      alias: 'xyz',
      originalUrl: tUrl,
      shortUrl: 'https://short.com/xyz',
    );

    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.success(tLinkEntity));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    await tester.enterText(find.byType(TextField), tUrl);
    await tester.tap(find.text(AppStrings.shortenButton));

    await tester.pump();
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('YOUTUBE'), findsOneWidget);
    // Favicon should show 'Y', not 'W'
    final avatarText = find.descendant(
      of: find.byType(LinkHistoryCard),
      matching: find.text('Y'),
    );
    expect(avatarText, findsOneWidget);
  });

  testWidgets('should show snackbar on error', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    const tUrl = 'https://google.com';
    const tFailure = Failure.network();

    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => const Result.failure(tFailure));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    await tester.enterText(find.byType(TextField), tUrl);
    await tester.tap(find.text(AppStrings.shortenButton));

    await tester.pump(); // Start loading
    await tester.pump(); // Finish loading with error
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(AppStrings.errorNoInternet), findsOneWidget);
  });
}
