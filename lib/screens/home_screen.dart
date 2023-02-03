import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/database_helper.dart';
import '../widgets/note_card.dart';
import 'note_editor.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Note>?>(
          future: DatabaseHelper.getAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text('Loading..'),
                ],
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) => NoteCard(
                          note: snapshot.data![index],
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoteEditorScreen(
                                          note: snapshot.data![index],
                                        )));
                            setState(() {});
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
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        onPressed: () async {
                                          await DatabaseHelper.deleteNote(
                                              snapshot.data![index]);
                                          if (context.mounted) {
                                            Navigator.of(context).pop();
                                          }
                                          setState(() {});
                                        },
                                        child: const Text('Yes'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('No'),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ));
              }
            }

            return Padding(
              padding: const EdgeInsets.only(top: 64),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/empty.png',
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(height: 18.0),
                    const Text(
                      'No notes yet',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteEditorScreen()));
        },
        label: const Text("create"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
