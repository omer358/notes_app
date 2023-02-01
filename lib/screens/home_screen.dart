
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
          log("what is going on here!");
          if (snapshot.hasData) {
            log("The snapshot has some data and the condition has been aprooved!");
            return GridView.builder(
              itemCount: snapshot.data!.length,
              clipBehavior: Clip.antiAlias,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                log("item builder is working");
                return noteCard( (){
                  log("the notecard is returned");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>
                              NotePage(data: snapshot.data![index])));
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
              builder: (context) => const NoteEditorScreen()));
          },
          label: const Text("create"),
      icon: const Icon(Icons.add),),
    );
  }


}