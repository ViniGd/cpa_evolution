import 'package:cpa_evolution/widgets/social/avaliacao.dart';
import 'package:cpa_evolution/widgets/social/resumo.dart';
import 'package:cpa_evolution/widgets/social/score.dart';
import 'package:cpa_evolution/widgets/social/titulo.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';

class Troll extends StatelessWidget {
  const Troll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Score(9.8),
              Vazio(10,0),
              Titulo("ETE", "699" , "Vini mestre gnomo"),
              Vazio(10,0),
              Resumo('ETE', '699', 'Vini mestre dos gnomos' , 9.8),
              Vazio(10,0),
              Avaliacao("Aluno","Doni", 10, "batatabatatabatatabatatabatatabatatabatatabatatabatatabatatabatatabatatabatatabatatabatataatabatatabatataatabatatabatataatabatatabatataatabatatabatataatabatatabatataatabatatabatataatabatatabatataatabatatabatataatabatatabatataatabatatabatataatabatatabatata"),
            ],
          )
        ],
      )
    );
  }
}
