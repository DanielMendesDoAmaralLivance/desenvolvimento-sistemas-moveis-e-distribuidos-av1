import 'package:fast_location/src/shared/components/logo/app_icon_logo.dart';
import 'package:fast_location/src/shared/components/logo/app_text_logo.dart';
import 'package:flutter/material.dart';

class AppFullLogoHorizontal extends StatelessWidget {
  const AppFullLogoHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [AppIconLogo(), AppTextLogo()],
    );
  }
}
