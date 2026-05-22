import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/result.dart';
import '../../domain/entities/link_entity.dart';
import '../../domain/repositories/link_repository.dart';
import '../datasources/link_local_datasource.dart';
import '../datasources/link_remote_datasource.dart';

class LinkRepositoryImpl implements LinkRepository {
  final LinkRemoteDataSource _remoteDataSource;
  final LinkLocalDataSource _localDataSource;

  LinkRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<LinkEntity>> shortenLink(String url) async {
    try {
      final model = await _remoteDataSource.shortenLink(url);
      return Result.success(model.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return const Result.failure(Failure.network());
      }
      if (e.response?.statusCode != null) {
        if (e.response?.statusCode == 404) {
          return const Result.failure(Failure.notFound());
        }
        return Result.failure(
          Failure.serverError(statusCode: e.response!.statusCode!),
        );
      }
      return const Result.failure(Failure.unknown());
    } catch (e) {
      return const Result.failure(Failure.unknown());
    }
  }

  @override
  Future<List<LinkEntity>> getLinks() {
    return _localDataSource.getLinks();
  }

  @override
  Future<void> saveLinks(List<LinkEntity> links) {
    return _localDataSource.saveLinks(links);
  }
}
