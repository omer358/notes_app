import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/bindings/authentication_manager.dart';
import 'package:notes_app/screens/on_board.dart';

class SplashView extends StatelessWidget {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  SplashView({super.key});

  Future<void> initializeSettings() async {
    _authManager.checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnBoard();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return const Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text(
            'Loading...',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ));
  }
}
