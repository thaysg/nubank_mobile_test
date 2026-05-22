import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/link_entity.dart';

abstract class LinkLocalDataSource {
  Future<void> saveLinks(List<LinkEntity> links);
  Future<List<LinkEntity>> getLinks();
}

class LinkLocalDataSourceImpl implements LinkLocalDataSource {
  final SharedPreferences _sharedPreferences;
  static const _key = 'shortened_links';

  LinkLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> saveLinks(List<LinkEntity> links) async {
    final list = links.map((e) => {
      'alias': e.alias,
      'originalUrl': e.originalUrl,
      'shortUrl': e.shortUrl,
    }).toList();
    await _sharedPreferences.setString(_key, jsonEncode(list));
  }

  @override
  Future<List<LinkEntity>> getLinks() async {
    final jsonString = _sharedPreferences.getString(_key);
    if (jsonString == null) return [];
    
    try {
      final List<dynamic> list = jsonDecode(jsonString);
      return list.map((e) => LinkEntity(
        alias: e['alias'],
        originalUrl: e['originalUrl'],
        shortUrl: e['shortUrl'],
      )).toList();
    } catch (_) {
      return [];
    }
  }
}
