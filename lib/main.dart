import 'package:fast_location/src/modules/history/page/history_page.dart';
import 'package:fast_location/src/modules/home/page/home_page.dart';
import 'package:fast_location/src/modules/initial/page/initial_page.dart';
import 'package:fast_location/src/routes/app_routes.dart';
import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/storage/app_local_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalStorage.setupHive();

  runApp(const FastLocationApp());
}

class FastLocationApp extends StatelessWidget {
  const FastLocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Location App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.theme),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.history: (context) => const HistoryPage(),
      },
      home: const InitialPage(),
    );
  }
}
