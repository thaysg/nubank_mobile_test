import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/result.dart';
import '../../domain/usecases/shorten_link_usecase.dart';
import 'link_history_provider.dart';
import 'link_repository_provider.dart';

part 'shorten_link_provider.g.dart';

@riverpod
ShortenLinkUseCase shortenLinkUseCase(Ref ref) {
  final repository = ref.watch(linkRepositoryProvider);
  return ShortenLinkUseCase(repository);
}

@riverpod
class ShortenLink extends _$ShortenLink {
  late ShortenLinkUseCase _useCase;

  @override
  AsyncValue<void> build() {
    _useCase = ref.watch(shortenLinkUseCaseProvider);
    return const AsyncValue.data(null);
  }

  Future<void> shorten(String url) async {
    state = const AsyncValue.loading();
    
    final result = await _useCase.execute(url);

    await result.when(
      success: (link) async {
        state = const AsyncValue.data(null);
        await ref.read(linkHistoryProvider.notifier).addLink(link);
      },
      failure: (failure) async {
        state = AsyncValue.error(failure, StackTrace.current);
      },
    );
  }
}
