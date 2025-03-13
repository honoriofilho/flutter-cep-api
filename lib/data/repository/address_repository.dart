import 'package:cep_api/data/model/address.dart';
import 'package:cep_api/data/provider/address_api.dart';

class AddressRepository {
  AddressRepository(this._apiClient);

  final AddressApiClient _apiClient;

  Future<Address> getAddress(String zipCode) async {
    final Address address = await _apiClient.getAddress(zipCode: zipCode);
    return address;
  }
}
