import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/metrics/app_text_metrics.dart';
import 'package:flutter/material.dart';

class AppTextLogo extends StatelessWidget {
  const AppTextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Fast Location App",
      style: TextStyle(
        fontSize: AppTextMetrics.xLarge,
        fontWeight: FontWeight.bold,
        color: AppColors.theme,
      ),
      textAlign: TextAlign.center,
    );
  }
}
