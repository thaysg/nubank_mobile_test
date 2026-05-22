// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/link_entity.dart';

part 'link_model.freezed.dart';
part 'link_model.g.dart';

@freezed
abstract class LinkModel with _$LinkModel {
  const factory LinkModel({
    required String alias,
    @JsonKey(name: '_links') required LinkLinksModel links,
  }) = _LinkModel;

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);

  const LinkModel._();

  LinkEntity toEntity() => LinkEntity(
        alias: alias,
        originalUrl: links.self,
        shortUrl: links.short,
      );
}

@freezed
abstract class LinkLinksModel with _$LinkLinksModel {
  const factory LinkLinksModel({
    required String self,
    required String short,
  }) = _LinkLinksModel;

  factory LinkLinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinkLinksModelFromJson(json);
}
