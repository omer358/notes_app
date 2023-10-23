import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:notes_app/controllers/authentication_manager.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/models/login_request_model.dart';
import 'package:notes_app/models/login_response_model.dart';
import 'package:notes_app/models/signup_request.dart';
import 'package:notes_app/services/rest_apis.dart';

class LoginController extends GetxController {
  final log = Logger("LoginController");
  final RestAPIs apiService = Get.find<RestAPIs>();
  late final AuthenticationManager _authManager;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();
  RxBool passwordVisibility = true.obs;

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find<AuthenticationManager>();
    apiService.getDataMethod();
  }

  Future<void> loginUser() async {
    LoginResponseModel? response = await apiService.fetchLogin(
        LoginRequestModel(
            username: usernameController.value.text,
            password: passController.value.text));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.accessToken);
      Get.find<NotesController>();
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

  Future<void> signUp() async {
    LoginResponseModel? response = await apiService.performSignup(SignUpRequest(
        firstName: firstNameController.value.text,
        lastName: lastNameController.value.text,
        email: emailController.value.text,
        username: usernameController.value.text,
        password: passwordController.value.text,
        confirmPassword: confPassController.value.text));
    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.accessToken);
      Get.find<NotesController>();
      Get.back();
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
