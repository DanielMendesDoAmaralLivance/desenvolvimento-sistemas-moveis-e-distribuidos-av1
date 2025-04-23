import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/repositories/address_repository.dart';

class AddressService {
  final repository = AddressRepository();

  Future<AddressModel?> getFromZipCodeAsync(String zipCode) async {
    return repository.getFromZipCodeAsync(zipCode);
  }
}
