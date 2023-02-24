import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/style/app_style.dart';

import '../controllers/notes_controller.dart';

class NoteEditorScreen extends StatelessWidget{
  NoteEditorScreen({super.key});
  final notesController = Get.find<NotesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit note",
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
          onPressed: ()  async{
            notesController.addNoteToDatabase();
          },
          label: const Text("Add"),
          icon: const Icon( Icons.add )),
    );
  }
}
