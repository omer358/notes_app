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
        title: Text("Notes"),
      ),
      body: GetX<NotesController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.notesList?.length,
            itemBuilder: (context, index) => NoteCard(
                  note: controller.notesList![index],
                  onTap: () {
                    Get.to(
                        NoteEditorScreen(),
                        arguments: controller.notesList![index]);
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
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: () {},
                                child: const Text('Yes'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('No'),
                              ),
                            ],
                          );
                        });
                  },
                ));
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(NoteEditorScreen());
        },
        label: const Text("create"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
