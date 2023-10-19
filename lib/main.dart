import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';
import 'package:notes_app/screens/routes/app_pages.dart';
import 'package:notes_app/screens/splash_screen.dart';
import 'package:notes_app/style/color_schemes.g.dart';
import 'package:notes_app/utils/translation.dart';

import 'controllers/bindings/notes_bindings.dart';

void main(List<String> args) async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print(
        '${record.level.name}: ${record.time}: ${record.loggerName}: \t ${record.message}');
  });
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final log = Logger("MyApp");

  @override
  Widget build(BuildContext context) {
    log.info("Main Class");
    return GetMaterialApp(
        title: "My app",
        initialBinding: NotesBindings(),
        translations: AppTranslations(),
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'us'),
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: SplashView());
  }
}
