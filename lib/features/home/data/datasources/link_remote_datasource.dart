import 'package:dio/dio.dart';
import '../models/link_model.dart';

abstract class LinkRemoteDataSource {
  Future<LinkModel> shortenLink(String url);
}

class LinkRemoteDataSourceImpl implements LinkRemoteDataSource {
  final Dio _dio;

  LinkRemoteDataSourceImpl(this._dio);

  @override
  Future<LinkModel> shortenLink(String url) async {
    final response = await _dio.post(
      '/api/alias',
      data: {'url': url},
    );

    return LinkModel.fromJson(response.data);
  }
}
