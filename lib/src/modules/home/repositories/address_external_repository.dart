import 'package:dio/dio.dart';
import 'package:fast_location/src/http/app_http_dio_client.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/routes/external_routes.dart';

class AddressExternalRepository {
  final httpClient = AppHttpDioClient(ExternalRoutes.viaCepApiBaseUrl);

  AddressExternalRepository() {
    httpClient.dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (response.data["erro"] == "true") {
            throw Exception("Endereço não encontrado");
          }

          return handler.next(response);
        },
      ),
    );
  }

  Future<AddressModel?> getFromZipCodeAsync(String zipCode) async {
    var path = ExternalRoutes.viaCepApiGetAddressFromZipCodeUrlPathTemplate
        .replaceAll("{{1}}", zipCode);

    var response = await httpClient.get(path);

    return AddressModel.fromJson(response.data);
  }
}
