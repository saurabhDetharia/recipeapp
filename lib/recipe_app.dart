import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipeapp/core/app_strings.dart';
import 'package:recipeapp/core/configs/configs_core.dart';
import 'package:recipeapp/core/services/storage/hive_storage_service.dart';
import 'package:recipeapp/core/services/storage/storage_service_provider.dart';

import 'core/services/storage/storage_service.dart';

class RecipeApp extends ConsumerWidget {

  const RecipeApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final storage = ref.watch(storageServiceProvider);
    bool isOnboard = storage.get(StorageKeys.isOnboard) ?? false;

    return CupertinoApp(
      title: Strings.title,
      debugShowCheckedModeBanner: false,
      home: isOnboard ? const HomePage() : const OnBoardingScreen(),
    );
  }

}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }

}

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
    );
  }

}