import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:flutter/material.dart';


class Professores extends StatelessWidget {
  const Professores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu(),
          Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
              child: Text(
                "Professores",
                style: TextStyle(fontSize: 80, color: Color(0xff004684)),
              ),
            ),

          ],),
          Rodape(),
        ],
      ),
    );
  }
}
