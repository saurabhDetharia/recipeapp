import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipeapp/core/services/storage/hive_storage_service.dart';
import 'package:recipeapp/core/services/storage/storage_service.dart';

/// [StorageService] interface provider
final storageServiceProvider = Provider<StorageService>((ref) {
  return HiveStorageService();
});