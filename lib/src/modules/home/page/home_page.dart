import 'package:fast_location/src/modules/home/components/last_searched_address_data.dart';
import 'package:fast_location/src/modules/home/components/last_searched_address_empty_state.dart';
import 'package:fast_location/src/modules/home/components/short_history.dart';
import 'package:fast_location/src/modules/home/controller/home_controller.dart';
import 'package:fast_location/src/routes/app_routes.dart';
import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:fast_location/src/shared/components/app_bar/custom_app_bar.dart';
import 'package:fast_location/src/shared/components/app_feedback/app_feedback.dart';
import 'package:fast_location/src/shared/metrics/app_metrics.dart';
import 'package:fast_location/src/shared/metrics/app_text_metrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  final _zipCodeController = TextEditingController();

  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();

    _controller.listAddresses();

    _disposer = reaction<bool>((_) => _controller.hasErrorOnSearchAddress, (
      hasError,
    ) {
      if (hasError) {
        final errorMessage = _controller.errorMessageOnSearchAddress;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erro ao localizar o destino: $errorMessage"),
            duration: Duration(seconds: 6),
          ),
        );

        _controller.hasErrorOnSearchAddress = false;
        _controller.errorMessageOnSearchAddress = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
              padding: EdgeInsets.all(AppMetrics.mainContainerPadding),
              child: Column(
                children: [
                  _buildLastSearchedAddressSection(),
                  const SizedBox(height: 20),
                  _buildSearchAddressButton(),
                  const SizedBox(height: 60),
                  ShortHistory(addresses: _controller.addresses),
                  const SizedBox(height: 20),
                  _buildGoToFullListButton(),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
        style: TextStyle(fontSize: AppTextMetrics.regular, color: Colors.white),
      ),
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
        style: TextStyle(fontSize: AppTextMetrics.regular, color: Colors.white),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: AppColors.theme,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.navigation, color: Colors.white),
            onPressed: () async {
              if (_controller.lastAddressSearched != null) {
                try {
                  final addressQuery =
                      "${_controller.lastAddressSearched!.publicPlace}, ${_controller.lastAddressSearched!.neighborhood}, ${_controller.lastAddressSearched!.locality}, ${_controller.lastAddressSearched!.state}";

                  List<Location> locations = await locationFromAddress(
                    addressQuery,
                  );

                  final availableMaps = await MapLauncher.installedMaps;

                  await availableMaps.first.showMarker(
                    coords: Coords(
                      locations.first.latitude,
                      locations.first.longitude,
                    ),
                    title: addressQuery,
                  );
                  return;
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Erro ao traçar a rota até o seu destino!'),
                      duration: Duration(seconds: 6),
                    ),
                  );
                }
              }

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Você precisa fazer uma busca para localizar seu destino antes de traçar a rota até ele!',
                  ),
                  duration: Duration(seconds: 6),
                ),
              );
            },
          ),
        ),
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
                  style: TextStyle(
                    fontSize: AppTextMetrics.regular,
                    fontWeight: FontWeight.normal,
                  ),
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

                      _zipCodeController.clear();

                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.theme,
                    ),
                    child: const Text(
                      "Buscar",
                      style: TextStyle(
                        fontSize: AppTextMetrics.regular,
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

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }
}
