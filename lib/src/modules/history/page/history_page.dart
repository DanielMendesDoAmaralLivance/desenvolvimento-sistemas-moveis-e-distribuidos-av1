import 'package:fast_location/src/modules/history/controller/history_controller.dart';
import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/components/address_list/address_list.dart';
import 'package:fast_location/src/shared/components/app_bar/custom_app_bar.dart';
import 'package:fast_location/src/shared/components/app_feedback/app_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _controller = HistoryController();

  @override
  void initState() {
    super.initState();
    _controller.listAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Histórico", showBackButton: true),
      backgroundColor: AppColors.background,
      body: Observer(
        builder: (_) {
          if (_controller.isLoading || _controller.hasError) {
            return AppFeedback(
              isLoading: _controller.isLoading,
              hasError: _controller.hasError,
            );
          }

          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: AddressList(addresses: _controller.addresses),
            ),
          );
        },
      ),
    );
  }
}
