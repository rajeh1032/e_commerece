import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

@singleton
class HiveUtils {
  static const _boxName = 'favoriteBox';
  static const _key = 'favorites';

  Future<void> saveFavorite(String productId) async {
    final box = await Hive.openBox(_boxName);
    final favorites = box.get(_key, defaultValue: <String>[]).cast<String>();
    favorites.add(productId);
    await box.put(_key, favorites.toList());
  }

  Future<void> removeFavorite(String productId) async {
    final box = await Hive.openBox(_boxName);
    final favorites = box.get(_key, defaultValue: <String>[]).cast<String>();
    favorites.remove(productId);
    await box.put(_key, favorites.toList());
  }

  Future<bool> isFavorite(String productId) async {
    final box = await Hive.openBox(_boxName);
    final favorites = box.get(_key, defaultValue: <String>[]).cast<String>();
    return favorites.contains(productId);
  }

  Future<List<String>> getAllFavorites() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_key, defaultValue: <String>[]).cast<String>();
  }
}
