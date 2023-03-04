import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class  EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/images/empty.json'),
         Text(
          "empty_state".tr,style: const TextStyle(
            fontSize: 25,fontWeight: FontWeight.w500
        ),
        ),
      ],

    );
  }
}
