import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/style/app_style.dart';

import '../controllers/notes_controller.dart';

class NoteEditorScreen extends StatelessWidget{
  NoteEditorScreen({super.key});
  final notesController = Get.find<NotesController>();

  @override
  Widget build(BuildContext context) {
    // final int i = ModalRoute.of(context)?.settings.arguments as int;
    // print("the index value is $i");
    // final note = notesController.notesList![i];
    return Scaffold(
      backgroundColor: AppStyle.cardColor[notesController.color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[notesController.color_id],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: const Text("Edit note",
          style:  TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: notesController.titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 28.0),
            TextField(
              controller: notesController.contentController,
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
          onPressed: ()  async{
            notesController.addNoteToDatabase();
          },
          label: const Text("Add"),
          icon: const Icon( Icons.add )),
    );
  }
}
