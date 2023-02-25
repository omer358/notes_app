// import 'dart:developer';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'dart:convert';


// Future<List<Note>> fetchAllUsers() async {
//   // use local host http://localhost:8000 for IOS
//   // use http://10.0.2.2:8000 for android emulator
//   final response =
//       await http.get(Uri.parse("http://10.0.2.2:8000 /notes/"), headers: {
//     HttpHeaders.authorizationHeader:
//         "Token 2eecc26069498a70db3ced8c6f636a37053015b6"
//   });
//   if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body);
//     return jsonResponse.map((data) => Note.fromJson(data)).toList();
//   } else {
//     throw Exception("Failed to load Notes");
//   }
// }

// Future<void> createNote(Note newNote) async {
//   var data = json.encode(<String, dynamic>{
//     "title": newNote.title,
//     "content": newNote.content,
//     "color_id": newNote.color,
//   });
//   log(data);
//   http.Response response =
//       await http.post(Uri.parse("http://10.0.2.2:8000 /notes/"),
//           headers: {
//             'Content-Type': 'application/json',
//             HttpHeaders.authorizationHeader:
//                 "Token 2eecc26069498a70db3ced8c6f636a37053015b6"
//           },
//           body: data);
//   log(response.statusCode.toString());
// }
