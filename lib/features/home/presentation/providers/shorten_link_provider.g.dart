// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorten_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shortenLinkUseCase)
final shortenLinkUseCaseProvider = ShortenLinkUseCaseProvider._();

final class ShortenLinkUseCaseProvider
    extends
        $FunctionalProvider<
          ShortenLinkUseCase,
          ShortenLinkUseCase,
          ShortenLinkUseCase
        >
    with $Provider<ShortenLinkUseCase> {
  ShortenLinkUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shortenLinkUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shortenLinkUseCaseHash();

  @$internal
  @override
  $ProviderElement<ShortenLinkUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShortenLinkUseCase create(Ref ref) {
    return shortenLinkUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShortenLinkUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShortenLinkUseCase>(value),
    );
  }
}

String _$shortenLinkUseCaseHash() =>
    r'737411caebca4edb786c95ca7f13ee4eeb18ad77';

@ProviderFor(ShortenLink)
final shortenLinkProvider = ShortenLinkProvider._();

final class ShortenLinkProvider
    extends $NotifierProvider<ShortenLink, AsyncValue<void>> {
  ShortenLinkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shortenLinkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shortenLinkHash();

  @$internal
  @override
  ShortenLink create() => ShortenLink();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$shortenLinkHash() => r'dede44623f611331a9b404e339d405a575d5c75d';

abstract class _$ShortenLink extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
