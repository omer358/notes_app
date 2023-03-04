import 'package:flutter/material.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/screens/empty_state_screen.dart';
import 'package:notes_app/screens/note_viewer_screen.dart';
import '../widgets/note_card.dart';
import 'new_note.dart';
import 'package:get/get.dart';

class NotesPage extends StatelessWidget {
  NotesPage({super.key});

  final noteController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notes".tr),
      ),
      body: Obx(
        () => noteController.isEmpty()
            ? const Center(child: EmptyState())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                    ),
                    itemCount: noteController.notesList.value.length,
                    itemBuilder: (context, index) => NoteCard(
                      note: noteController.notesList.value[index],
                      onTap: () async {
                        Get.to(() => NoteViewer(),
                            arguments: noteController.notesList.value[index]);
                      },
                      onLongPress: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:  Text(
                                  'delete_msg'.tr),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    noteController.deleteNote(noteController
                                        .notesList.value[index].id);
                                  },
                                  child: Text('yes'.tr),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child:  Text('no'.tr),
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
        label:  Text("create".tr),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
