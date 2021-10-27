import 'package:cpa_evolution/widgets/menu.dart';
import 'package:cpa_evolution/widgets/rodape.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu(),
          Container(),
          Rodape(),
        ],
      ),
    );
  }
}
