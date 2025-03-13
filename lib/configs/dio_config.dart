import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioConfig {
  static Dio createHttpClient() {
    final Dio dio = Dio();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
    return dio;
  }
}
