import 'package:flutter/material.dart';
import 'package:notes_app/screens/home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app",
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: const NotesPage()
      ),
    );
  }
}
