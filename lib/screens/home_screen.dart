import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/database_helper.dart';
import '../widgets/note_card.dart';
import 'note_editor.dart';
import 'package:get/get.dart';

class NotesPage extends StatelessWidget {
  NotesPage({super.key});

  final noteController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Obx( () => ListView.builder(
            itemCount: noteController.notesList.value.length,
            itemBuilder: (context, index) => NoteCard(
                  note: noteController.notesList.value[index],
                  onTap: () async{
                    Get.to(
                        NoteEditorScreen(),
                        arguments: noteController.notesList.value[index]);
                  },
                  onLongPress: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                'Are you sure you want to delete this note?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  noteController.deleteNote(noteController.notesList.value[index].id);
                                  },
                                child: const Text('Yes'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        });
                  },
                )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          Get.to(NoteEditorScreen());
        },
        label: const Text("create"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
