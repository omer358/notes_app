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

import 'dart:developer';

import 'package:get/get.dart';
import 'package:notes_app/models/note_model.dart';

class RestAPI {
  static const String BASE_URL = "http://10.0.2.2:8000";
  final GetConnect connect = Get.find<GetConnect>();

  //GET request example
  Future<dynamic> getDataMethod() async {
    Response response = await connect.get('$BASE_URL/ping');
    if (response.statusCode == 200) {
      log("200 OK");
      return response.body;
    } else {
      log("Something went wrong");
      return null;
    }
  }

  Future<dynamic> fetchAllNotes() async {
    Map<String, String> authorization = {"Authorization": "Token "};
    Response response =
        await connect.request("$BASE_URL/notes", "GET", headers: authorization);
    if (response.statusCode == 200) {
      log("response 200 OK");
      return Note.fromJson(response.body);
    } else {
      log("Something went wrong!");
      log(response.statusCode.toString());
      return null;
    }
  }

  //post request example
  Future<dynamic> postNewNote() async {
    //body data
    FormData formData = FormData({
      'title': 'field_value',
      'field_name': 'field_value',
    });

    Response response = await connect.post('your_post_api_url', formData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
