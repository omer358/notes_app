import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/database_helper.dart';
import 'package:notes_app/style/app_style.dart';

class NoteEditorScreen extends StatelessWidget {
  final Note? note;
  NoteEditorScreen({super.key, this.note});

  int color_id = Random().nextInt(AppStyle.cardColor.length);

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (note != null) {
      _titleController.text = note!.title;
      _mainController.text = note!.content;
    }
    return Scaffold(
      backgroundColor: AppStyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[color_id],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Text(
          note == null ? "Add a new Note" : "Edit note",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 28.0),
            TextField(
              controller: _mainController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Content",
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppStyle.accentColor,
          onPressed: () async {
            final title = _titleController.value.text;
            final content = _mainController.value.text;

            if (title.isEmpty || content.isEmpty) {
              return;
            }

            final Note model = Note(
                title: title, content: content, id: note?.id, color: color_id);
            if (note == null) {
              await DatabaseHelper.addNote(model);
            } else {
              await DatabaseHelper.updateNote(model);
            }

            Navigator.of(context).pop();
          },
          label: Text(note == null ? "Add" : "Edit"),
          icon: Icon(note == null ? Icons.add : Icons.edit)),
    );
  }
}
