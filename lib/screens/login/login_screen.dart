import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:notes_app/controllers/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});

  final log = Logger("LoginScreen");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset(
                  "assets/images/vector-1.png",
                  width: 500,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF755DC1),
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: controller.emailController,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _passController,
                      textInputAction: TextInputAction.done,
                      obscureText: passwordVisibility,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.loginUser();
                      },
                      child: const Text("Login"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 2.5,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
