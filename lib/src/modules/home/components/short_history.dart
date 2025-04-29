import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/components/address_list/address_list.dart';
import 'package:fast_location/src/shared/metrics/app_text_metrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ShortHistory extends StatefulWidget {
  final ObservableList<AddressModel> addresses;

  const ShortHistory({super.key, required this.addresses});

  @override
  State<ShortHistory> createState() => _ShortHistoryState();
}

class _ShortHistoryState extends State<ShortHistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Últimos endereços localizados",
          style: TextStyle(
            fontSize: AppTextMetrics.large,
            fontWeight: FontWeight.bold,
            color: AppColors.theme,
          ),
        ),
        const SizedBox(height: 20),
        Observer(
          builder: (_) {
            return AddressList(addresses: widget.addresses);
          },
        ),
      ],
    );
  }
}
