import '../../../../core/errors/result.dart';
import '../entities/link_entity.dart';

abstract class LinkRepository {
  Future<Result<LinkEntity>> shortenLink(String url);
  Future<void> saveLinks(List<LinkEntity> links);
  Future<List<LinkEntity>> getLinks();
}
