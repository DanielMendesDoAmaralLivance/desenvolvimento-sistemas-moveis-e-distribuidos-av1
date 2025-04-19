import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextLogo extends StatelessWidget {
  const AppTextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Fast Location App",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColors.theme,
      ),
    );
  }
}
