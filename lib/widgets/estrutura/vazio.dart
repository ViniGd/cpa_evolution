import 'package:flutter/material.dart';

class Vazio extends StatelessWidget {

  double altura;

  Vazio(this.altura);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      height: altura,
      width: MediaQuery.of(context).size.width,
    ));
  }
}
