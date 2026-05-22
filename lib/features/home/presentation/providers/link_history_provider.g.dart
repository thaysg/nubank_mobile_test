// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LinkHistory)
final linkHistoryProvider = LinkHistoryProvider._();

final class LinkHistoryProvider
    extends $NotifierProvider<LinkHistory, List<LinkEntity>> {
  LinkHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'linkHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$linkHistoryHash();

  @$internal
  @override
  LinkHistory create() => LinkHistory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LinkEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LinkEntity>>(value),
    );
  }
}

String _$linkHistoryHash() => r'69ef37bcb19047c0494c8581439f4c9a09f7b873';

abstract class _$LinkHistory extends $Notifier<List<LinkEntity>> {
  List<LinkEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<LinkEntity>, List<LinkEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<LinkEntity>, List<LinkEntity>>,
              List<LinkEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
