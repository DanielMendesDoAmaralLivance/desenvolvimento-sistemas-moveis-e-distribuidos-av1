import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class LastSearchedAddressData extends StatelessWidget {
  final AddressModel lastSearchedAddress;

  const LastSearchedAddressData({super.key, required this.lastSearchedAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.themeLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Dados da localização',
              style: TextStyle(
                color: AppColors.theme,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Logradouro/Rua:', lastSearchedAddress.publicPlace),
          const SizedBox(height: 4),
          _buildInfoRow('Bairro/Distrito:', lastSearchedAddress.neighborhood),
          const SizedBox(height: 4),
          _buildInfoRow(
            'Cidade/UF:',
            "${lastSearchedAddress.locality}/${lastSearchedAddress.state}",
          ),
          const SizedBox(height: 4),
          _buildInfoRow('CEP:', lastSearchedAddress.zipCode),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.theme,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(child: Text(value)),
      ],
    );
  }
}
