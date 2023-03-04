import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/style/app_style.dart';

import '../controllers/notes_controller.dart';

class CreateNewNote extends StatelessWidget{
  CreateNewNote({super.key});
  final notesController = Get.find<NotesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("create_note".tr,
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
              decoration:  InputDecoration(
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
            String title = notesController.titleController.text;
            String content = notesController.contentController.text;
            notesController.addNoteToDatabase(title,content);
          },
          label: Text("add".tr),
          icon: const Icon( Icons.add )),
    );
  }
}
