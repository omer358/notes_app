import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:notes_app/models/new_note_model.dart';
import 'package:notes_app/style/app_style.dart';

import '../../controllers/notes_controller.dart';

class NoteEditor extends StatelessWidget {
  NoteEditor({super.key});

  final log = Logger("NoteEditor");
  final notesController = Get.find<NotesController>();

  @override
  Widget build(BuildContext context) {
    final NewNote newNote = Get.arguments;
    log.info("New Note ${newNote.toString()}");
    notesController.titleController.text = newNote.title;
    notesController.contentController.text = newNote.content;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "edit_note".tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: notesController.titleController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "note_title".tr,
                ),
                style: AppStyle.mainTitle,
              ),
              const SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: TextField(
                  controller: notesController.contentController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "note_content".tr,
                  ),
                  style: AppStyle.mainContent,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            notesController.updateNote(newNote);
          },
          label: Text("save".tr),
          icon: const Icon(Icons.save)),
    );
  }
}
