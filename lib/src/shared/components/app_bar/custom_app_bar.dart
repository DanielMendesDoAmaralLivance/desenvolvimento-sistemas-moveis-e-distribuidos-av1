import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/components/logo/app_full_logo_horizontal.dart';
import 'package:fast_location/src/shared/metrics/app_text_metrics.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? showBackButton;

  const CustomAppBar({super.key, this.title, this.showBackButton});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.themeLight,
        elevation: 0,
        title:
            title != null && title!.trim() != ""
                ? Text(
                  title!,
                  style: TextStyle(
                    fontSize: AppTextMetrics.xLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.theme,
                  ),
                  textAlign: TextAlign.center,
                )
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    height: 60,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: AppFullLogoHorizontal(),
                    ),
                  ),
                ),
        leading: showBackButton == true ? _buildBackButton(context) : null,
        automaticallyImplyLeading: false,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: AppColors.theme),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
