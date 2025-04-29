import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/metrics/app_text_metrics.dart';
import 'package:flutter/material.dart';

class AddressListItem extends StatelessWidget {
  final AddressModel address;

  const AddressListItem({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: AppColors.themeLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.history, color: AppColors.theme, size: 24),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.neighborhood,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppTextMetrics.regular,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                address.publicPlace,
                style: TextStyle(fontSize: AppTextMetrics.small),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${address.locality}, ${address.state}",
              style: TextStyle(fontSize: AppTextMetrics.small),
            ),
            const SizedBox(height: 2),
            Text(
              address.zipCode,
              style: TextStyle(fontSize: AppTextMetrics.small),
            ),
          ],
        ),
      ],
    );
  }
}
