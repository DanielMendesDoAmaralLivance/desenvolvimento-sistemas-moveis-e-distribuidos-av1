import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/components/logo/app_full_logo_horizontal.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.themeLight,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: 60,
            child: FittedBox(
              fit: BoxFit.contain,
              child: AppFullLogoHorizontal(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
