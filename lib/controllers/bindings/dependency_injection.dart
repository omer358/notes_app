import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());
  }
}
