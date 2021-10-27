import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Avaliacao extends StatelessWidget {
  String patente;
  String nome;
  double nota;
  String comentario;

  Avaliacao(this.patente, this.nome,this.nota,this.comentario);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: MediaQuery.of(context).size.width * 0.48,
      height: 250,
      decoration:  BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(20),),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.37,
            height: 50,
            decoration:  BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(20),),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Vazio(0, 10),
                Text('$patente $nome diz:', style: TextStyle(color: Colors.white, fontSize: 16,),),
                Vazio(0,500),
                Text('Nota: $nota/10', style: TextStyle(color: Colors.white, fontSize: 16,),),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.37,
            height: 200,

            decoration:  BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(20),),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('$comentario', style: TextStyle(color: Colors.white, fontSize: 15),),
              ],
            ),
          ),
          ],
      ),
    ));
  }
}
