import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppIconLogo extends StatelessWidget {
  const AppIconLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.public, size: 75, color: AppColors.theme);
  }
}
