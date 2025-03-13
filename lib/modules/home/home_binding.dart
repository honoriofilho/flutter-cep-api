import 'package:cep_api/configs/dio_config.dart';
import 'package:cep_api/data/provider/address_api.dart';
import 'package:cep_api/data/repository/address_repository.dart';
import 'package:cep_api/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        AddressRepository(
          AddressApiClient(DioConfig.createHttpClient()),
        ),
      ),
    );
  }
}
