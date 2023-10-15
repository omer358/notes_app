import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/bindings/authentication_manager.dart';
import 'package:notes_app/screens/login/login_screen.dart';
import 'package:notes_app/screens/notes/home_screen.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? NotesPage() : LoginScreen();
    });
  }
}
