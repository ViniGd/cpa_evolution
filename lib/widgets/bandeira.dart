import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import "package:flutter/material.dart";

class Bandeira extends StatefulWidget {

  String titulo;
  String descricao;


  Bandeira(this.titulo, this.descricao,);

  @override
  State<Bandeira> createState() => _BandeiraState();
}

class _BandeiraState extends State<Bandeira> {
  double fonte_fix = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          var parentWidth = constraints.maxWidth;
          if(parentWidth < 650){
            fonte_fix = 6;
          }else{
            fonte_fix = 0;
          }
          return  Center(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.6,
            padding: const EdgeInsets.fromLTRB(60, 30, 60, 30),
            decoration: const BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(50),),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.titulo,
                  style: TextStyle(color: Colors.white, fontSize: 50-fonte_fix*2.5,),),
                Vazio(30, 0),
                Text(
                  widget.descricao,
                  style: TextStyle(color: Colors.white, fontSize: 20-fonte_fix,),
                ),
                Vazio(30, 0),
                GestureDetector(
                  onTap: (){print("funfou");},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    height: 60-fonte_fix*2,
                    decoration: const BoxDecoration(
                      color: Color(0xff4DA735),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text("Acessar", style: TextStyle(color: Colors.white, fontSize: 30-fonte_fix*1.5,),),),
                ),
              ],
            ),
          ),
        );}
    );
  }
}
