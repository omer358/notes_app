import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notes_controller.dart';

import '../models/note_model.dart';
import '../services/database_helper.dart';
import '../style/app_style.dart';

class NoteEditorController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  int color_id = Random().nextInt(AppStyle.cardColor.length);

  void addNoteToDatabase() async {
    String title = titleController.text;
    String content = contentController.text;
    Note note = Note(
      title: title,
      content: content, color: color_id,
    );

    await DatabaseHelper.addNote(note);
    titleController.text = "";
    contentController.text = "";
    Get.back();
  }
}
