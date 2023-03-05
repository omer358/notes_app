import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
        title: Text("note_viewer".tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => NoteEditor(), arguments: note);
            },
            icon: const Icon(Icons.edit),
            tooltip: 'edit'.tr,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('delete_msg'.tr),
                    actions: [
                      TextButton(
                        onPressed: () {
                          noteController.deleteNote(note.id);
                          Get.offAll(NotesPage());
                        },
                        child: Text('yes'.tr),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('no'.tr),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete),
            tooltip: 'delete'.tr,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                note.title,
                style: AppStyle.mainTitle,
              ),
              const SizedBox(height: 8.0),
              Text("Created: "
                  "${DateFormat('MMM, '
                      'd, '
                      'yyyy').format(
                DateTime.parse(note.createdDate.toString()),
              )}"),
              const SizedBox(height: 2.0),
              Text("Edited: "
                  "${DateFormat('EEEE, '
                      'MMM d, '
                      'hh:mm a ').format(
                DateTime.parse(note.updatedAt),
              )}"),
              const SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: SelectableText(
                  note.content,
                  style: AppStyle.mainContent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
