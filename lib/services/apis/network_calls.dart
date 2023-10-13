import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:notes_app/core/authentication_manager.dart';
import 'package:notes_app/models/login_request_model.dart';
import 'package:notes_app/models/login_response_model.dart';

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

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await connect.post("$BASE_URL/api/token", model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      log("Something went wrong! ${response.statusCode}");
      log(response.body);
      return null;
    }
  }

  Future<List<dynamic>> fetchAllNotes() async {
    String? TOKEN = Get.find<AuthenticationManager>().getToken();
    Map<String, String> authorization = {"Authorization": "Bearer $TOKEN"};
    Response response =
        await connect.request("$BASE_URL/notes", "GET", headers: authorization);
    if (response.isOk) {
      List<dynamic> data = response.body;
      return data;
    } else {
      log("Something went wrong!");
      log(response.statusCode.toString());
      return [];
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
