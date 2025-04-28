import 'package:fast_location/src/modules/home/components/last_searched_address_data.dart';
import 'package:fast_location/src/modules/home/components/last_searched_address_empty_state.dart';
import 'package:fast_location/src/modules/home/controller/home_controller.dart';
import 'package:fast_location/src/routes/app_routes.dart';
import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/components/address_list/address_list.dart';
import 'package:fast_location/src/shared/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  final _zipCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.listAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildLastSearchedAddressSection(),
              const SizedBox(height: 20),
              _buildSearchAddressButton(),
              const SizedBox(height: 60),
              _buildShortHistorySection(),
              const SizedBox(height: 20),
              _buildGoToFullListButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLastSearchedAddressSection() {
    return Observer(
      builder: (_) {
        var lastAddressSearched = _controller.lastAddressSearched;

        return lastAddressSearched != null
            ? LastSearchedAddressData(lastSearchedAddress: lastAddressSearched)
            : LastSearchedAddressEmptyState();
      },
    );
  }

  Widget _buildSearchAddressButton() {
    return ElevatedButton(
      onPressed: () => _showSearchAddressFromZipCodeDialog(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.theme,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Localizar endereço',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  Widget _buildShortHistorySection() {
    return Column(
      children: [
        Text(
          "Últimos endereços localizados",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.theme,
          ),
        ),
        const SizedBox(height: 20),
        Observer(
          builder: (_) {
            return AddressList(addresses: _controller.addresses);
          },
        ),
      ],
    );
  }

  Widget _buildGoToFullListButton() {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pushNamed(AppRoutes.history),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.theme,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Visualizar histórico completo',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  void _showSearchAddressFromZipCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Digite o CEP",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _zipCodeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "00000000",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.theme, width: 2),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.theme, width: 2),
                    ),
                  ),
                  maxLength: 8,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      _controller.searchAddress(_zipCodeController.text);

                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.theme,
                    ),
                    child: const Text(
                      "Buscar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
