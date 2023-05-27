/// Storage service interface
abstract class StorageService {

  // To initialize service
  Future<void> init();

  // To remove item by key
  Future<void> remove(String key);

  // To get item by key
  dynamic get(String key);

  // To get all items by key
  dynamic getAll(String key);

  // To clear storage
  Future<void> clear();

  // To check if the item exists
  bool exists(String key);

  // To set data
  Future<void> set(String key, dynamic data);

  // To terminate service
  Future<void> close();
}