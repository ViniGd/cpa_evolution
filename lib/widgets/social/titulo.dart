import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';

class Titulo extends StatefulWidget {

  String codigomat;
  String nomemat;
  double largura;
  double fonte_fix;

  Titulo(this.codigomat, this.nomemat,this.largura, this.fonte_fix);

  @override
  State<Titulo> createState() => _TituloState();
}

class _TituloState extends State<Titulo> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: MediaQuery.of(context).size.width * widget.largura,
      height: 80,
      decoration: BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(20),),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${widget.codigomat}', style: TextStyle(color: Colors.white, fontSize: 20 -widget.fonte_fix,),),
          Vazio(5,0),
          Text('${widget.nomemat}', style: TextStyle(color: Colors.white, fontSize: 20-widget.fonte_fix,),),
        ],
      ),
    ));
  }
}

