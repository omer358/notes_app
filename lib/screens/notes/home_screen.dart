import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:notes_app/controllers/login_controller.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/screens/notes/note_viewer_screen.dart';
import 'package:notes_app/widgets/empty_state_screen.dart';

import '../../widgets/note_card.dart';
import 'new_note.dart';

class NotesPage extends GetWidget<NotesController> {
  final log = Logger("NotesPage");

  NotesPage({super.key});

  LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notes".tr),
        actions: [
          IconButton(
              onPressed: () {
                var _title = lorem(paragraphs: 1, words: 5);
                var _content = lorem(paragraphs: 5, words: 500);
                controller.addNote(_title, _content);
                log.info("A random note has been created");
              },
              icon: const Icon(Icons.ads_click)),
          IconButton(
              onPressed: () {
                loginController.logoutUser();
                Get.delete<NotesController>();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(
            () => controller.isLoading.value
            ? const Loading()
            : controller.isEmpty.value
                ? const EmptyState()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                        ),
                        itemCount: controller.notesList.value.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            secondaryBackground: Container(
                              color: Colors.white,
                              child: const Center(
                                child: Icon(Icons.delete_forever),
                              ),
                            ),
                            background: Container(color: Colors.white),
                            onDismissed: (direction) {
                              controller.deleteNote(
                                  controller.notesList.value[index].id);
                            },
                            child: NoteCard(
                              note: controller.notesList.value[index],
                              onTap: () async {
                                Get.to(() => NoteViewer(),
                                    arguments:
                                        controller.notesList.value[index]);
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
                                            controller.deleteNote(controller
                                                .notesList.value[index].id);
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
                          );
                        }),
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

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text(
            'Loading...',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
