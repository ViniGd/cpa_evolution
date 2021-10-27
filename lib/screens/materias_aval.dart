import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/social/avaliacao.dart';
import 'package:cpa_evolution/widgets/social/score.dart';
import 'package:cpa_evolution/widgets/social/titulo.dart';
import 'package:flutter/material.dart';

class Materias_aval extends StatelessWidget {
  const Materias_aval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Menu(),
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Titulo("curso", "codigomat", "nomemat"),
                Vazio(0, 50),
                Score(4.5),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Avaliacao("aluno","nome", 7, "comentario"),
                Vazio(10, 0),
                Avaliacao("aluno","nome", 7, "comentario"),
                Vazio(10, 0),
                Avaliacao("aluno","nome", 7, "comentario"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pag.  ", style: TextStyle(color: Color(0xff004684),fontSize: 15),),
                GestureDetector(
                    onTap: (){print("Mudapag");},
                    child: Container(
                      child: Text("1", style: TextStyle(color: Color(0xff004684),fontSize: 15),),
                    )
                ),
                Vazio(0, 5),
                GestureDetector(
                    onTap: (){print("Mudapag");},
                    child: Container(
                      child: Text("2", style: TextStyle(color: Color(0xff004684),fontSize: 15),),
                    )
                ),
                Vazio(0, 5),
                GestureDetector(
                    onTap: (){print("Mudapag");},
                    child: Container(
                      child: Text("3", style: TextStyle(color: Color(0xff004684),fontSize: 15),),
                    )
                ),
                Vazio(0, 5),
                GestureDetector(
                    onTap: (){print("Mudapag");},
                    child: Container(
                      child: Text("4", style: TextStyle(color: Color(0xff004684),fontSize: 15),),
                    )
                ),
                Vazio(0, 5),
                GestureDetector(
                    onTap: (){print("Mudapag");},
                    child: Container(
                      child: Text("5", style: TextStyle(color: Color(0xff004684),fontSize: 15),),
                    )
                ),
                Vazio(0, 5),
                GestureDetector(
                    onTap: (){print("Mudapag");},
                    child: Container(
                      child: Text("6", style: TextStyle(color: Color(0xff004684), fontSize: 15),),
                    )
                ),
                Vazio(0, 5),
                Text("...", style: TextStyle(color: Color(0xff004684),fontSize: 15),),
              ],
            ),
          ),
          Rodape(),
        ],),

    );
  }
}