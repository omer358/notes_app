import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/screens/empty_state_screen.dart';
import 'package:notes_app/screens/note_viewer_screen.dart';

import '../widgets/note_card.dart';
import 'new_note.dart';

class NotesPage extends GetWidget<NotesController> {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notes".tr),
        actions: [
          IconButton(
              onPressed: () {
                log("The button has been clicked!");
                var _title = lorem(paragraphs: 1, words: 5);
                var _content = lorem(paragraphs: 5, words: 500);
                log(_title);
                controller.addNoteToDatabase(_title, _content);
              },
              icon: const Icon(Icons.ads_click))
        ],
      ),
      body: Obx(
        () => controller.isNotesListEmpty()
            ? const Center(child: EmptyState())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                    ),
                    itemCount: controller.notesList.value.length,
                    itemBuilder: (context, index) => NoteCard(
                      note: controller.notesList.value[index],
                      onTap: () async {
                        Get.to(() => NoteViewer(),
                            arguments: controller.notesList.value[index]);
                      },
                      onLongPress: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('delete_msg'.tr),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    controller.deleteNote(
                                        controller.notesList.value[index].id);
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
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Get.to(CreateNewNote());
        },
        label: Text("create".tr),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
