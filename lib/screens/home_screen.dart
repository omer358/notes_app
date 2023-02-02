
import 'dart:developer';


import 'package:flutter/material.dart';
import '../helpers.dart';
import '../network_calls.dart';
import '../widgets/note_card.dart';
import 'note_detials_screen.dart';
import 'note_editor.dart';


class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late Future<List<Note>> futureNote;

  @override
  void initState() {
    super.initState();
    futureNote = fetchAllUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Note>>(
        future: futureNote,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              clipBehavior: Clip.antiAlias,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return noteCard( (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>
                              NoteEditorScreen(note: snapshot.data![index], )));
                },
                    snapshot.data![index]);
              });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>   NoteEditorScreen(note: Note("","","","",0),)));
          },
          label: const Text("create"),
      icon: const Icon(Icons.add),),
    );
  }


}