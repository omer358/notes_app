import 'package:get/get.dart';
import 'package:notes_app/core/authentication_manager.dart';
import 'package:notes_app/models/login_request_model.dart';
import 'package:notes_app/services/apis/network_calls.dart';

class LoginController extends GetxController {
  late final RestAPI apiService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    apiService = Get.find<RestAPI>();
    _authManager = Get.find();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await apiService
        .fetchLogin(LoginRequestModel(email: email, password: password));

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
