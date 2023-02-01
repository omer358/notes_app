import "package:flutter/material.dart";
import 'package:notes_app/main.dart';

import '../helpers.dart';
import 'home_screen.dart';

class NotePage extends StatelessWidget {
  const NotePage({required this.data,Key? key}) : super(key: key);
  final Note data;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Note Details"),
      ),
      body:  Center(
        child: Text(data.title.toString()),
      ),
    );
  }
}
