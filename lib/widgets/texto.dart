import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  const Texto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      height: 200,
      padding: EdgeInsets.fromLTRB(60, 30, 60, 30),
      decoration: BoxDecoration(color: Color(0xffffffff), borderRadius: BorderRadius.all(Radius.circular(50),),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
      "minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
      "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia"
          "deserunt mollit anim id est laborum.", style: TextStyle(color: Colors.black, fontSize: 22),),
      ]
      ),
    ));
  }
}
