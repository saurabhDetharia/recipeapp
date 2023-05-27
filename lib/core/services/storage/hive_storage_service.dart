import 'package:hive_flutter/adapters.dart';
import 'package:recipeapp/core/services/storage/storage_service.dart';

class HiveStorageService implements StorageService {

  /// A hive box instance
  late Box<dynamic> hiveBox;

  /// To open a hive box
  Future<void> openBox() async {
    hiveBox = await Hive.openBox<dynamic>('RECIPE_APP');
  }

  @override
  Future<void> init() async {
    await openBox();
  }

  @override
  Future<void> clear() async {
    await hiveBox.clear();
  }

  @override
  Future<void> close() async {
    await hiveBox.close();
  }

  @override
  bool exists(String key) {
    return hiveBox.containsKey(key);
  }

  @override
  get(String key) {
    return hiveBox.get(key);
  }

  @override
  getAll(String key) {
    return hiveBox.values.toList();
  }

  @override
  Future<void> remove(String key) async {
    return await hiveBox.delete(key);
  }

  @override
  Future<void> set(String key, data) async {
    await hiveBox.put(key, data);
  }
}