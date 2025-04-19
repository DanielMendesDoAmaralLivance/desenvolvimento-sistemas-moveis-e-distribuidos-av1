import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/components/logo/app_full_logo_horizontal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppFullLogoHorizontal(),
    );
  }
}
