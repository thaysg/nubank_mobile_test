import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_mobile_test/core/providers/shared_preferences_provider.dart';
import 'package:nubank_mobile_test/features/home/domain/entities/link_entity.dart';
import 'package:nubank_mobile_test/features/home/presentation/providers/link_history_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences sharedPrefs;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPrefs = await SharedPreferences.getInstance();
  });

  setUp(() {
    sharedPrefs.clear();
  });

  test('should persist and load links from shared preferences', () async {
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
    );

    const tLink = LinkEntity(
      alias: 'abc',
      originalUrl: 'https://google.com',
      shortUrl: 'https://short.com/abc',
    );

    // Initial state should be empty
    expect(container.read(linkHistoryProvider), []);

    // Add a link and AWAIT it
    await container.read(linkHistoryProvider.notifier).addLink(tLink);
    
    // Check in-memory state
    expect(container.read(linkHistoryProvider), [tLink]);

    // Create a NEW container to simulate app restart
    final container2 = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
    );

    // Initial state of second container should be empty briefly
    expect(container2.read(linkHistoryProvider), []);
    
    // Listen for changes using a Completer for deterministic waiting
    final completer = Completer<List<LinkEntity>>();
    container2.listen<List<LinkEntity>>(
      linkHistoryProvider,
      (previous, next) {
        if (next.isNotEmpty && !completer.isCompleted) {
          completer.complete(next);
        }
      },
      fireImmediately: true,
    );

    // Wait for the async load to complete via the completer
    final loadedLinks = await completer.future.timeout(
      const Duration(seconds: 2),
      onTimeout: () => throw TimeoutException('Links were never loaded'),
    );
    
    expect(loadedLinks, [tLink]);
    expect(container2.read(linkHistoryProvider), [tLink]);
  });
}
