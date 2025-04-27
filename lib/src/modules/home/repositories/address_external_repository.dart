import 'package:fast_location/src/http/app_http_dio_client.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/routes/external_routes.dart';

class AddressExternalRepository {
  final httpClient = AppHttpDioClient(ExternalRoutes.viaCepApiBaseUrl);

  Future<AddressModel?> getFromZipCodeAsync(String zipCode) async {
    var path = ExternalRoutes.viaCepApiGetAddressFromZipCodeUrlPathTemplate
        .replaceAll("{{1}}", zipCode);

    var response = await httpClient.get(path);

    return AddressModel.fromJson(response.data);
  }
}
