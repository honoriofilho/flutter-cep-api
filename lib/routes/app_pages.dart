import 'package:cep_api/modules/home/home_binding.dart';
import 'package:cep_api/modules/home/home_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
