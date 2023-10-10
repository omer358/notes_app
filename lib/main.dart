import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/controllers/bindings/dependency_injection.dart';
import 'package:notes_app/screens/login/login_screen.dart';
import 'package:notes_app/screens/routes/app_pages.dart';
import 'package:notes_app/style/color_schemes.g.dart';
import 'package:notes_app/translation.dart';

import 'controllers/bindings/notes_bindings.dart';

void main(List<String> args) async {
  await GetStorage.init();
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "My app",
        initialBinding: NotesBindings(),
        translations: AppTranslations(),
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'us'),
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: LoginScreen());
  }
}
