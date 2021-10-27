import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';

class Titulo extends StatelessWidget {

  String codigomat;
  String curso;
  String nomemat;

  Titulo(this.curso, this.codigomat, this.nomemat);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 80,
      decoration: BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(20),),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$curso - $codigomat', style: TextStyle(color: Colors.white, fontSize: 20,),),
          Vazio(5,0),
          Text('$nomemat', style: TextStyle(color: Colors.white, fontSize: 20,),),
        ],
      ),
    ));
  }
}

