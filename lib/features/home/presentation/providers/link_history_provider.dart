import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/link_entity.dart';
import 'link_repository_provider.dart';

part 'link_history_provider.g.dart';

@riverpod
class LinkHistory extends _$LinkHistory {
  Completer<void>? _initCompleter;

  @override
  List<LinkEntity> build() {
    _initCompleter = Completer<void>();
    _loadLinks();
    return [];
  }

  Future<void> _loadLinks() async {
    final repository = ref.read(linkRepositoryProvider);
    final links = await repository.getLinks();
    if (!ref.mounted) return;
    state = links;
    if (_initCompleter != null && !_initCompleter!.isCompleted) {
      _initCompleter!.complete();
    }
  }

  Future<void> _saveLinks() async {
    final repository = ref.read(linkRepositoryProvider);
    await repository.saveLinks(state);
  }

  Future<void> addLink(LinkEntity link) async {
    await _initCompleter?.future;
    if (!ref.mounted) return;
    if (state.any((e) => e.alias == link.alias)) return;
    state = [link, ...state];
    await _saveLinks();
  }

  Future<void> removeLink(String alias) async {
    await _initCompleter?.future;
    if (!ref.mounted) return;
    state = state.where((e) => e.alias != alias).toList();
    await _saveLinks();
  }

  Future<void> clearHistory() async {
    await _initCompleter?.future;
    if (!ref.mounted) return;
    state = [];
    await _saveLinks();
  }
}
