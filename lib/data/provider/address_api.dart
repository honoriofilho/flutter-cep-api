import 'dart:developer';

import 'package:cep_api/data/model/address.dart';
import 'package:dio/dio.dart';

class AddressApiClient {
  AddressApiClient(this._client);

  final Dio _client;
  final String? baseUrl = 'https://viacep.com.br/ws';

  Future<Address> getAddress({required String zipCode}) async {
    try {
      final Response<dynamic> response =
          await _client.get('$baseUrl/$zipCode/json');

      if (response.statusCode == 200) {
        return Address.fromJson(response.data);
      } else {
        throw DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            error: 'Erro ao buscar o CEP');
      }
    } on DioException catch (error) {
      log(error.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      throw Exception(
          'Erro inesperado ao buscar o CEP'); // Lança uma exceção genérica
    }
  }
}
