import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/repositories/address_external_repository.dart';
import 'package:fast_location/src/modules/home/repositories/address_local_repository.dart';

class AddressService {
  final addressExternalRepository = AddressExternalRepository();
  final addressLocalRepository = AddressLocalRepository();

  Future<List<AddressModel>> list() async {
    return await addressLocalRepository.list();
  }

  Future<int> create(AddressModel address) async {
    return await addressLocalRepository.create(address);
  }

  Future<AddressModel?> getFromZipCodeAsync(String zipCode) async {
    return addressExternalRepository.getFromZipCodeAsync(zipCode);
  }
}
