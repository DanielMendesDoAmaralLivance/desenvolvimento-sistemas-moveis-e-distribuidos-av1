import 'package:dio/dio.dart';

class AppHttpDioClient {
  final dio = Dio();

  AppHttpDioClient(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }

  Future<Response> get(String path) async {
    Response response;

    response = await dio.get(path);

    return response;
  }
}
