import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class  EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/images/empty.json'),
        const Text(
          "No Notes Yet!",style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.w500
        ),
        ),
      ],

    );
  }
}
