import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/social/resumo.dart';
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Resumo("","R.A", "Nome", 5),
                  Vazio(10, 0),
                  Resumo("","R.A", "Nome", 6),
                  Vazio(10, 0),
                  Resumo("","R.A", "Nome", 7),
                  Vazio(10, 0),
                  Resumo("","R.A", "Nome", 5),
                  Vazio(10, 0),
                  Resumo("","R.A", "Nome", 6),
                  Vazio(10, 0),
                  Resumo("","R.A", "Nome", 7),
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
          ],),
          Rodape(),
        ],
      ),
    );
  }
}
