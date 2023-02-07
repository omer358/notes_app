import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/note_editor_controller.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/database_helper.dart';
import 'package:notes_app/style/app_style.dart';

import '../controllers/notes_controller.dart';

class NoteEditorScreen extends StatelessWidget{
  NoteEditorScreen({super.key});
  final NoteEditorController noteEditorController = Get.put(NoteEditorController());
  final notesController = Get.find<NotesController>();

  @override
  Widget build(BuildContext context) {
    final int i = ModalRoute.of(context)!.settings.arguments as int;
    print("the index value is $i");
    final note = notesController.notesList![i];
    noteEditorController.titleController.text = note.title;
    noteEditorController.contentController.text = note.content;
    return Scaffold(
      backgroundColor: AppStyle.cardColor[note.color],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[note.color],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Text("Edit note",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: noteEditorController.titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 28.0),
            TextField(
              controller: noteEditorController.contentController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Content",
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppStyle.accentColor,
          onPressed: ()  {
            noteEditorController.addNoteToDatabase();
          },
          label: Text(note == null ? "Add" : "Edit"),
          icon: Icon(note == null ? Icons.add : Icons.edit)),
    );
  }
}
