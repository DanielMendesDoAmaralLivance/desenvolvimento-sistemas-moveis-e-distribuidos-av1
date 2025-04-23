import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/services/address_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final addressService = AddressService();

  @observable
  AddressModel? lastAddressSearched;

  @action
  Future<void> searchAddress(String zipCode) async {
    lastAddressSearched = await addressService.getFromZipCodeAsync(zipCode);
  }
}
