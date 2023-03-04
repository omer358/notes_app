import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/services/database_helper.dart';

class NotesController extends GetxController{
  Rx<List<Note>> notesList = Rx<List<Note>>([]);
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllNotes();
  }

  @override
  void onClose() {
    log("The controller has been deleted");
  }

  bool isNotesListEmpty() {
    if (notesList.value.isEmpty) {
      log("is Empty!");
      return true;
    } else {
      log("is not Empty!");
      return false;
    }
  }

  Future getAllNotes() async{
    notesList.value = await DatabaseHelper.getAllNotes();
    log("the notelist is ready!");
  }

  void addNoteToDatabase(String title, String content) async {
    if (title.isNotEmpty || content.isNotEmpty) {
      Note note = Note(
        title: title,
        content: content,
      );
      await DatabaseHelper.addNote(note);
      titleController.text = "";
      contentController.text = "";
      getAllNotes();
      Get.back();
    }
    else{
      Get.snackbar(
          "Unable to save",
          "You can not Create an empty note!",
      snackPosition: SnackPosition.BOTTOM);
    }
  }
  void updateNote(int? id) async {
    String title = titleController.text;
    String content = contentController.text;
    Note note = Note(
      id: id,
      title: title,
      content: content,
    );
    await DatabaseHelper.updateNote(note);
    titleController.text = "";
    contentController.text = "";
    getAllNotes();
    Get.offAll(()=>NotesPage());
  }
  void deleteNote(int? noteId) async{
    await DatabaseHelper.deleteNote(noteId!);
    getAllNotes();
    Get.back();
  }
}