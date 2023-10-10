import 'package:get/get.dart';
import 'package:notes_app/controllers/bindings/notes_bindings.dart';
import 'package:notes_app/screens/notes/new_note.dart';
import 'package:notes_app/screens/notes/note_editor.dart';
import 'package:notes_app/screens/notes/note_viewer_screen.dart';
import 'package:notes_app/screens/routes/app_routes.dart';

import '../notes/home_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.notesList,
      page: () => NotesPage(),
      binding: NotesBindings(),
    ),
    GetPage(
      name: AppRoutes.editNote,
      page: () => NoteEditor(),
      binding: NotesBindings(),
    ),
    GetPage(
      name: AppRoutes.newNote,
      page: () => CreateNewNote(),
      binding: NotesBindings(),
    ),
    GetPage(
      name: AppRoutes.viewNote,
      page: () => NoteViewer(),
      binding: NotesBindings(),
    ),
  ];
}
