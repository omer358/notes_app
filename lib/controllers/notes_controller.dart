import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/database_helper.dart';

class NotesController extends GetxController{
  Rx<List<Note>> notesList = Rx<List<Note>>([]);
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllNotes();
  }

  Future getAllNotes() async{
    notesList.value = await DatabaseHelper.getAllNotes();
  }

  void addNoteToDatabase() async {
    String title = titleController.text;
    String content = contentController.text;
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

  void deleteNote(int? noteId) async{
    await DatabaseHelper.deleteNote(noteId!);
    getAllNotes();
    Get.back();
  }
}