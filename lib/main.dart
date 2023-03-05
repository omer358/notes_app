import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/style/color_schemes.g.dart';
import 'package:notes_app/translation.dart';

import 'controllers/bindings/notes_bindings.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "My app",
        initialBinding: NotesBindings(),
        translations: AppTranslations(),
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'us'),
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: const NotesPage());
  }
}
