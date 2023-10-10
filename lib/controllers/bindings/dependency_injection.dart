import 'package:get/get.dart';
import 'package:notes_app/services/network_calls.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());
    Get.put<RestAPI>(RestAPI());
  }
}
