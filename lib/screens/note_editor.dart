import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/network_calls.dart';
import 'package:notes_app/style/app_style.dart';

import '../helpers.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardColor.length);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();
  String date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[color_id],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: const Text(
          "Add a new Note",
          style: TextStyle(color: Colors.black),
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
            const SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: AppStyle.dateTitle,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          createNote(Note(
              title: _titleController.text,
          content: _mainController.text,
          color: color_id, createdDate: '', modifiedAt: ''));
          Navigator.pop(context);
          // FirebaseFirestore.instance.collection("notes").add({
          //   "title": _titleController.text,
          //   "content": _mainController.text,
          //   "creation_date": date,
          //   "color_id": color_id
          // }).then((value) {
          //   Navigator.pop(context);
          // }).catchError((error) {
          //   print("Failed to save the new note because of $error");
          // });
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
