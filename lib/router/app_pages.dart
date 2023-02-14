import 'package:get/get.dart';
import 'package:yx_app/modules/home/home_binding.dart';
import 'package:yx_app/modules/home/home_view.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MAIN,
      preventDuplicates: true,
      participatesInRootNavigator: true,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
