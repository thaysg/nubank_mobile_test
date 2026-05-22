import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/providers/shared_preferences_provider.dart';
import '../../data/datasources/link_local_datasource.dart';
import '../../data/datasources/link_remote_datasource.dart';
import '../../data/repositories/link_repository_impl.dart';
import '../../domain/repositories/link_repository.dart';

part 'link_repository_provider.g.dart';

@riverpod
LinkRepository linkRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  final remoteDataSource = LinkRemoteDataSourceImpl(apiClient.dio);
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  final localDataSource = LinkLocalDataSourceImpl(sharedPrefs);
  return LinkRepositoryImpl(remoteDataSource, localDataSource);
}
