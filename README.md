# notes_app
# Intro:

Notes-taking app built with flutter.

## The APIs:

This project is consuming restful APIs I built using Django, [notes-apis](https://github.com/omer358/Notes-APIs)

## dependencies:
* [Getx](https://chornthorn.github.io/getx-docs/) to manage states, navigation, translations, etc...
* [flutter_lorem](https://pub.dev/packages/flutter_lorem), to quick generation of new titles and content for new notes.
* [sqflite](https://pub.dev/packages/sqflite) to implement the local database.
* [lottie](https://pub.dev/packages/lottie) to implement animated assets.
* [intl](https://pub.dev/packages/intl) to handle the localization and internalization.

## Features:
The current version of the app support:

* adding, editing, and deleting notes to and from APIs 
  to the app.
* The app is built using [Material 3](https://m3.material.io/) desgin system for the theme and
  color.
* support Dark Mode.
* Support two languages: `ar`, and `en`
  
 ## Screenshots:
 | Notes Screen | Notes Screen Dark Mod Screen | 
|    :---:     |     :---:      |  
| <img src="screenshots/notes_list.png" width="300">  | <img src="screenshots/notes_list_dm.png" width="300"> | 
| New Note Screen | New Note Screen Dark Mod Screen | 
|    :---:     |     :---:      |  
| <img src="screenshots/new_note.png" width="300">  | <img src="screenshots/new_note_dm.png" width="300"> | 

| note Detail Screen | Note Details Screen In Dark Mode| 
|    :---:     |     :---:      |  
| <img src="screenshots/note_viewer.png" width="300">   | <img src="screenshots/note_viewer_dm.png" width="300">   |

| New Note Screen Screen | New Note Dark Mode Screen| 
|    :---:     |     :---:      |  
| <img src="screenshots/new_note.png" width="300">   | <img src="screenshots/new_note_dm.png" width="300">   |

| Edit Note Screen | Edit Note Dark Mode Screen| 
|    :---:     |     :---:      |  
| <img src="screenshots/note_editor.png" width="300">   | <img src="screenshots/note_editor_dm.png" width="300">   |

