// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(linkRepository)
final linkRepositoryProvider = LinkRepositoryProvider._();

final class LinkRepositoryProvider
    extends $FunctionalProvider<LinkRepository, LinkRepository, LinkRepository>
    with $Provider<LinkRepository> {
  LinkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'linkRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$linkRepositoryHash();

  @$internal
  @override
  $ProviderElement<LinkRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LinkRepository create(Ref ref) {
    return linkRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LinkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LinkRepository>(value),
    );
  }
}

String _$linkRepositoryHash() => r'a31b2e2bce2bf61a107b5641a8293f770d62368d';
