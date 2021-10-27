import 'package:flutter/material.dart';

class Vazio extends StatelessWidget {

  double altura;
  double espaco;

  Vazio(this.altura, this.espaco);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      height: altura,
      width: espaco,
    ));
  }
}
