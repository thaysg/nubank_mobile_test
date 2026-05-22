import 'package:equatable/equatable.dart';

class LinkEntity extends Equatable {
  final String alias;
  final String originalUrl;
  final String shortUrl;

  const LinkEntity({
    required this.alias,
    required this.originalUrl,
    required this.shortUrl,
  });

  @override
  List<Object?> get props => [alias, originalUrl, shortUrl];
}
