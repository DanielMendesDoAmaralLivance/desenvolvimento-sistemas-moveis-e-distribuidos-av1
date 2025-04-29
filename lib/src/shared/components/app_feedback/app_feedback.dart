import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/metrics/app_text_metrics.dart';
import 'package:flutter/material.dart';

class AppFeedback extends StatelessWidget {
  final bool? isLoading;

  final bool? hasError;
  final String? errorMessage;

  final bool? isEmpty;

  const AppFeedback({
    super.key,
    this.isLoading,
    this.hasError,
    this.errorMessage,
    this.isEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return hasError == true
        ? _buildHasError(context)
        : isLoading == true
        ? _buildIsLoading(context)
        : isEmpty == true
        ? _buildIsEmpty(context)
        : Container();
  }

  Widget _buildHasError(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.errorLight,
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.error_outline, color: Colors.white, size: 40),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              errorMessage ?? "Ocorreu um erro",
              style: const TextStyle(
                fontSize: AppTextMetrics.medium,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Por favor, recarregue o aplicativo ou tente novamente mais tarde.',
              style: TextStyle(fontSize: AppTextMetrics.regular),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIsLoading(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColors.theme, strokeWidth: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildIsEmpty(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.theme,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.themeLight,
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.feed_outlined, color: Colors.white, size: 40),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Não há nada por aqui ainda!",
              style: const TextStyle(
                fontSize: AppTextMetrics.medium,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
