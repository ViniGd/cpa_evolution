import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';

class Resumo extends StatelessWidget {
  String curso;
  String codigo;
  String nomecurso;
  double score;

  Resumo(this.curso,this.codigo,this.nomecurso,this.score);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 80,
      decoration: BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(5),),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$curso-$codigo - $nomecurso", style: TextStyle(color: Colors.white, fontSize: 20,),),
          Vazio(0, 360),
          Text("| $score/10", style: TextStyle(color: Colors.white, fontSize: 20,),),
        ],
      ),
    ));
  }
}
