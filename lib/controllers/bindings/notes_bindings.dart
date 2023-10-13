import 'package:get/get.dart';
import 'package:notes_app/controllers/login_controller.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/services/apis/network_calls.dart';

class NotesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GetConnect>(GetConnect());
    Get.put<RestAPI>(RestAPI());
    Get.lazyPut<NotesController>(() => NotesController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
