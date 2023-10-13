import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:notes_app/models/new_note_model.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/notes/home_screen.dart';
import 'package:notes_app/services/database_helper.dart';
import 'package:notes_app/services/rest_apis.dart';

class NotesController extends GetxController {
  final log = Logger("NotesController");
  Rx<List<Note>> notesList = Rx<List<Note>>([]);
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  RestAPIs restAPI = Get.find<RestAPIs>();

  @override
  void onInit() {
    super.onInit();
    getAllNotes();
  }

  @override
  void onClose() {
    log.fine("The controller has been deleted");
  }

  bool isNotesListEmpty() {
    if (notesList.value.isEmpty) {
      log.warning("The list notes is Empty!");
      return true;
    } else {
      log.fine("The list notes is not Empty!");
      return false;
    }
  }

  Future getAllNotes() async {
    var results = await restAPI.fetchAllNotes();
    List<Note> notes = List.generate(
      results.length,
      (index) => Note.fromJson(results[index]),
    );
    log.info("The length of the notesList ${notes.length.toString()}");
    for (var note in notes) {
      log.info(note.toString());
    }
    notesList.value.addAll(notes);
  }

  // Future getAllNotes() async {
  //   notesList.value = await DatabaseHelper.getAllNotes();
  //   log("the notelist is ready!");
  // }

  void addNote(String title, String content) async {
    if (title.isNotEmpty || content.isNotEmpty) {
      NewNote newNote = NewNote(title: title, content: content);
      await restAPI.createNewNote(newNote);
      titleController.text = "";
      contentController.text = "";
      getAllNotes();
      Get.back();
    } else {
      Get.snackbar("Unable to save", "You can not Create an empty note!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void updateNote(Note updatedNote) async {
    String title = titleController.text;
    String content = contentController.text;
    updatedNote.title = title;
    updatedNote.content = content;
    updatedNote.modifiedAt = DateTime.now().toString();
    log.info(updatedNote.toString());

    await DatabaseHelper.updateNote(updatedNote);
    titleController.text = "";
    contentController.text = "";
    // getAllNotes();
    Get.offAll(() => NotesPage());
  }

  void deleteNote(int? noteId) async {
    log.info(noteId);
    await restAPI.deleteNote(noteId!);
    getAllNotes();
    Get.back();
  }
}
