import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/style/app_style.dart';

import '../controllers/notes_controller.dart';
import '../models/note_model.dart';

class NoteEditor extends StatelessWidget{
  NoteEditor({super.key});
  final notesController = Get.find<NotesController>();
  @override
  Widget build(BuildContext context) {
    final Note note = Get.arguments;
    notesController.titleController.text = note.title;
    notesController.contentController.text = note.content;
    return Scaffold(
      appBar: AppBar(
        title:  Text("edit_note".tr,
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
              const SizedBox(height: 16.0),
              TextField(
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
            ],
          ),),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: ()  async{
            notesController.updateNote(note.id);
          },
          label: Text("save".tr),
          icon: const Icon( Icons.save )),
    );
  }
}
