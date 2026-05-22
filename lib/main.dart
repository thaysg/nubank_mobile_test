import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/providers/shared_preferences_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
      // DevicePreview was used during development to validate the responsive
      // layout across multiple screen sizes without needing physical devices.
      // Disabled for submission — swap to BuildWithDevicePreview() to preview.
      // child: kDebugMode
      //     ? const BuildWithDevicePreview()
      //     : const LinkShortenerApp(),
      child: const LinkShortenerApp(),
    ),
  );
}
