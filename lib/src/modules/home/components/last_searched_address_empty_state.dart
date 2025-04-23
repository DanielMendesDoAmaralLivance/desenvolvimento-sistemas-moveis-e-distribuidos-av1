import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class LastSearchedAddressEmptyState extends StatefulWidget {
  const LastSearchedAddressEmptyState({super.key});

  @override
  State<LastSearchedAddressEmptyState> createState() =>
      _LastSearchedAddressEmptyStateState();
}

class _LastSearchedAddressEmptyStateState
    extends State<LastSearchedAddressEmptyState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.themeLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.theme,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.travel_explore, color: Colors.white, size: 30.0),
          ),
          const SizedBox(height: 15),
          const Text(
            'Faça uma busca para localizar seu destino',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
