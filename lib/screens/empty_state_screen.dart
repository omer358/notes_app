import 'package:flutter/cupertino.dart';

class  EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Center(
    child:  Text("There's no list yet!",
style: TextStyle(fontSize: 22.0),),
    );
  }
}
