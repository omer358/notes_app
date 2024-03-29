import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:logging/logging.dart';
import 'package:notes_app/controllers/authentication_manager.dart';
import 'package:notes_app/models/login_request_model.dart';
import 'package:notes_app/models/login_response_model.dart';
import 'package:notes_app/models/new_note_model.dart';
import 'package:notes_app/models/signup_request.dart';

import '../models/note_model.dart';

class RestAPIs {
  final log = Logger("RestAPIs");
  static const String BASE_URL = "http://10.0.2.2:8000";
  final GetConnect connect = Get.find<GetConnect>();

  //GET request example
  Future<dynamic> getDataMethod() async {
    Response response = await connect.get('$BASE_URL/ping');
    if (response.statusCode == 200) {
      log.finest("200 OK");
      return response.body;
    } else {
      var results = {
        "Status code": response.statusCode,
        "response body": response.body
      };
      log.info(results);
      return results;
    }
  }

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await connect.post("$BASE_URL/api/token", model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      log.shout("Something went wrong! ${response.statusCode}");
      log.shout(response.body);
      return null;
    }
  }

  Future<List<Note>> fetchAllNotes() async {
    String? TOKEN = Get.find<AuthenticationManager>().getToken();
    Map<String, String> authorization = {"Authorization": "Bearer $TOKEN"};
    Response response = await connect.request("$BASE_URL/notes/", "GET",
        headers: authorization);
    if (response.isOk) {
      List<dynamic> data = response.body;
      List<Note> notes = List.generate(
        data.length,
        (index) => Note.fromJson(data[index]),
      );
      return notes;
    } else {
      log.shout("Something went wrong! ${response.statusCode.toString()}");
      return [];
    }
  }

  Future deleteNote(int noteId) async {
    String? TOKEN = Get.find<AuthenticationManager>().getToken();
    Map<String, String> authorization = {"Authorization": "Bearer $TOKEN"};
    Response response = await connect
        .request("$BASE_URL/notes/$noteId/", "DELETE", headers: authorization);
    if (response.statusCode == 204) {
      log.finest(
          "The note with $noteId has been deleted, ${response.statusCode.toString()}");
      return;
    } else {
      log.shout("something went wrong");
    }
  }

  //post request example
  Future<dynamic> createNewNote(NewNote newNote) async {
    String? TOKEN = Get.find<AuthenticationManager>().getToken();
    Map<String, String> authorization = {"Authorization": "Bearer $TOKEN"};
    Response response = await connect.post("$BASE_URL/notes/", newNote.toJson(),
        headers: authorization);
    log.info("add new note response: ${response.statusCode}");
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future updateNote(NewNote updatedNote) async {
    String? TOKEN = Get.find<AuthenticationManager>().getToken();
    Map<String, String> authorization = {"Authorization": "Bearer $TOKEN"};
    Response response = await connect.put(
        "$BASE_URL/notes/${updatedNote.id}/", updatedNote.toJson(),
        headers: authorization);
  }

  Future performSignup(SignUpRequest signUpRequest) async {
    final response =
        await connect.post("$BASE_URL/register", signUpRequest.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      log.shout("Something went wrong! ${response.statusCode}");
      log.shout(response.body);
      return null;
    }
  }
}
