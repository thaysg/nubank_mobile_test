// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LinkModel _$LinkModelFromJson(Map<String, dynamic> json) => _LinkModel(
  alias: json['alias'] as String,
  links: LinkLinksModel.fromJson(json['_links'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LinkModelToJson(_LinkModel instance) =>
    <String, dynamic>{'alias': instance.alias, '_links': instance.links};

_LinkLinksModel _$LinkLinksModelFromJson(Map<String, dynamic> json) =>
    _LinkLinksModel(
      self: json['self'] as String,
      short: json['short'] as String,
    );

Map<String, dynamic> _$LinkLinksModelToJson(_LinkLinksModel instance) =>
    <String, dynamic>{'self': instance.self, 'short': instance.short};
