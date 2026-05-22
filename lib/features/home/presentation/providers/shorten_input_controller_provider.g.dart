// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorten_input_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shortenInputController)
final shortenInputControllerProvider = ShortenInputControllerProvider._();

final class ShortenInputControllerProvider
    extends
        $FunctionalProvider<
          TextEditingController,
          TextEditingController,
          TextEditingController
        >
    with $Provider<TextEditingController> {
  ShortenInputControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shortenInputControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shortenInputControllerHash();

  @$internal
  @override
  $ProviderElement<TextEditingController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TextEditingController create(Ref ref) {
    return shortenInputController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$shortenInputControllerHash() =>
    r'362352fd3d27595008131b0a6212ce4a929c3a9e';
