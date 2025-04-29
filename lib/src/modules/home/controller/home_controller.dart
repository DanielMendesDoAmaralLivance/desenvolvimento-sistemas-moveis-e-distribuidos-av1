import 'package:dio/dio.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/services/address_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final addressService = AddressService();

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  @observable
  AddressModel? lastAddressSearched;

  @observable
  bool hasErrorOnSearchAddress = false;
  @observable
  String? errorMessageOnSearchAddress;

  @observable
  ObservableList<AddressModel> addresses = ObservableList<AddressModel>();

  @action
  Future<void> searchAddress(String zipCode) async {
    try {
      isLoading = true;

      lastAddressSearched = await addressService.getFromZipCodeAsync(zipCode);

      if (lastAddressSearched != null) {
        await addressService.create(lastAddressSearched!);
      }

      await listAddresses();
    } on DioError catch (e) {
      isLoading = false;
      hasErrorOnSearchAddress = true;
      errorMessageOnSearchAddress = e.message;
    }
  }

  @action
  Future<void> listAddresses() async {
    try {
      isLoading = true;

      var data = (await addressService.list()).reversed.take(3).toList();

      addresses = ObservableList<AddressModel>.of(data);
    } catch (e) {
      hasError = true;
    } finally {
      await Future.delayed(const Duration(seconds: 1));
      isLoading = false;
    }
  }
}
