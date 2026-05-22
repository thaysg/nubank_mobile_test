import '../../../../core/errors/result.dart';
import '../entities/link_entity.dart';
import '../repositories/link_repository.dart';

class ShortenLinkUseCase {
  final LinkRepository _repository;

  ShortenLinkUseCase(this._repository);

  Future<Result<LinkEntity>> execute(String url) {
    return _repository.shortenLink(url);
  }
}
