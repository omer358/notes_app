import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:notes_app/controllers/bindings/authentication_manager.dart';
import 'package:notes_app/models/login_request_model.dart';
import 'package:notes_app/models/login_response_model.dart';
import 'package:notes_app/services/rest_apis.dart';

class LoginController extends GetxController {
  final log = Logger("LoginController");
  final RestAPIs apiService = Get.find<RestAPIs>();
  late final AuthenticationManager _authManager;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  RxBool passwordVisibility = true.obs;

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find<AuthenticationManager>();
  }

  Future<void> loginUser() async {
    LoginResponseModel? response = await apiService.fetchLogin(
        LoginRequestModel(
            email: emailController.value.text,
            password: passController.value.text));

    log.info(response.toString());

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.accessToken);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back();
          });
    }
  }

  void logoutUser() {
    _authManager.logOut();
  }
//
// Future<void> registerUser(String email, String password) async {
//   final response = await apiService
//       .fetchRegister(RegisterRequestModel(email: email, password: password));
//
//   if (response != null) {
//     /// Set isLogin to true
//     _authManager.login(response.token);
//   } else {
//     /// Show user a dialog about the error response
//     Get.defaultDialog(
//         middleText: 'Register Error',
//         textConfirm: 'OK',
//         confirmTextColor: Colors.white,
//         onConfirm: () {
//           Get.back();
//         });
//   }
// }
}
