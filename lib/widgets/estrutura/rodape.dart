import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
  const Rodape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.1,
      color: Color(0xff004684),
      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Veneno anti-parasita"),
        ],
      ),
    ));
  }
}
