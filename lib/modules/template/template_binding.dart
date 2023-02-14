import 'package:get/get.dart';
import 'template_controller.dart';

class TemplateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TemplateController());
  }
}
