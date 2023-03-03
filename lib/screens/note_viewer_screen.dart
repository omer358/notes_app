import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/style/app_style.dart';

import '../controllers/notes_controller.dart';
import '../models/note_model.dart';
import 'note_editor.dart';

class NoteViewer extends StatelessWidget {
  NoteViewer({super.key});

  final noteController = Get.find<NotesController>();

  @override
  Widget build(BuildContext context) {
    final Note note = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Viewer"),
        actions: [
          IconButton(
              onPressed: (){
                Get.to(()=> NoteEditor(), arguments: note);
              },
              icon: const Icon(Icons.edit)),
          IconButton(onPressed: (){
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                      'Are you sure you want to delete this note?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        noteController.deleteNote(note.id);
                        Get.offAll(NotesPage());
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('No'),
                    ),
                  ],
                );
              },
            );
          }, icon: const Icon(Icons.delete),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 8, 4),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              note.title,
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 16.0),
            SelectableText(
              note.content,
              style: AppStyle.mainContent,
            ),
          ],
        ),
        ),
      ),
    );
  }
}
