import 'package:flutter/material.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';

class Score extends StatelessWidget {

  double nota;

  Score(this.nota);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.05,
        height: 80,
        decoration: BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(20),),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Score', style: TextStyle(color: Colors.white, fontSize: 20,),),
            Vazio(5,0),
            Text('$nota/10', style: TextStyle(color: Colors.white, fontSize: 20,),),
          ],
        ),
      ),
    );
  }
}



