import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';

class Resumo extends StatelessWidget {
  String codigo;
  String nome;
  String score;

  Resumo(this.codigo,this.nome,this.score, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 80,
      decoration: const BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(15),),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("$codigo - $nome", style: const TextStyle(color: Colors.white, fontSize: 20,),),
          Text("| $score", style: const TextStyle(color: Colors.white, fontSize: 20,),),
        ],
      ),
    ));
  }
}
