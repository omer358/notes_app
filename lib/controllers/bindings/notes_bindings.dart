import 'package:get/get.dart';
import 'package:notes_app/controllers/notes_controller.dart';

class NotesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesController>(() => NotesController(),fenix: true);
  }
}
