import 'dart:ffi';

import 'package:get/get.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/database_helper.dart';

class NotesController extends GetxController{
  List<Note>? notesList = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllNotes();
  }

  Future<Void>? getAllNotes() async{
    notesList = await DatabaseHelper.getAllNotes();
  }
}