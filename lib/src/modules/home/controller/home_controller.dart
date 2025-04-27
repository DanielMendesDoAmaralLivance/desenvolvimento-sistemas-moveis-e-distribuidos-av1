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
  AddressModel? lastAddressSearched;

  @observable
  ObservableList<AddressModel> addresses = ObservableList<AddressModel>();

  @action
  Future<void> searchAddress(String zipCode) async {
    lastAddressSearched = await addressService.getFromZipCodeAsync(zipCode);

    if (lastAddressSearched != null) {
      await addressService.create(lastAddressSearched!);
    }
  }

  @action
  Future<void> listAddresses() async {
    isLoading = true;
    var data = await addressService.list();
    data = data.reversed.take(3).toList();
    addresses = ObservableList<AddressModel>.of(data);
    isLoading = false;
  }
}
