import 'dart:async';

import 'package:fast_location/src/routes/app_routes.dart';
import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/components/logo/app_icon_logo.dart';
import 'package:fast_location/src/shared/components/logo/app_text_logo.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return RotationTransition(
                  turns: _rotateAnimation,
                  child: opacityAnimation(child),
                );
              },
              child: AppIconLogo(),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => opacityAnimation(child),
              child: AppTextLogo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget opacityAnimation(Widget? child) {
    return Opacity(
      opacity: _opacityAnimation.value,
      child: Transform.scale(scale: _scaleAnimation.value, child: child),
    );
  }
}
