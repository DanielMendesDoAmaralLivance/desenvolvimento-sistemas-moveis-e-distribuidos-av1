import 'package:fast_location/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class InitialSearchAddressComponent extends StatefulWidget {
  const InitialSearchAddressComponent({super.key});

  @override
  State<InitialSearchAddressComponent> createState() =>
      _InitialSearchAddressComponentState();
}

class _InitialSearchAddressComponentState
    extends State<InitialSearchAddressComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                      child: Icon(
                        Icons.travel_explore,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Faça uma busca para localizar seu destino',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showSearchAddressFromCepDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.theme,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Localizar endereço',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSearchAddressFromCepDialog(BuildContext context) {
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
