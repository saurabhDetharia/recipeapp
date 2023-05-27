import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipeapp/core/configs/storage_keys.dart';
import 'package:recipeapp/core/services/storage/hive_storage_service.dart';
import 'package:recipeapp/core/services/storage/storage_service.dart';
import 'package:recipeapp/core/services/storage/storage_service_provider.dart';
import 'package:recipeapp/recipe_app.dart';

void main() {
  runZonedGuarded(
    () async {

      // Hive initialization
      await Hive.initFlutter();

      // Storage service instance
      final StorageService storageService = HiveStorageService();

      // storage service initialization
      await storageService.init();

      runApp(
        ProviderScope(
          overrides: [
            storageServiceProvider.overrideWithValue(storageService),
          ],
          child: const RecipeApp(),
        ),
      );
    },
    (error, stack) {
      throw error;
    },
  );
}
