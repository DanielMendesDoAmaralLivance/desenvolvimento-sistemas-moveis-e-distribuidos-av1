import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/services/address_service.dart';
import 'package:mobx/mobx.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final addressService = AddressService();

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  @observable
  ObservableList<AddressModel> addresses = ObservableList<AddressModel>();

  @action
  Future<void> listAddresses() async {
    try {
      isLoading = true;
      var data = (await addressService.list()).reversed.toList();
      addresses = ObservableList<AddressModel>.of(data);
    } catch (e) {
      hasError = true;
    } finally {
      await Future.delayed(const Duration(seconds: 1));
      isLoading = false;
    }
  }
}
