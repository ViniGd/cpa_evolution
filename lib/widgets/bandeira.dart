import "package:flutter/material.dart";

class Bandeira extends StatelessWidget {

  String titulo;
  String descricao;

  Bandeira(this.titulo, this.descricao);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.6,
          height: 500,
          padding: EdgeInsets.fromLTRB(60, 30, 60, 30),
          decoration: BoxDecoration(color: Color(0xff004684), borderRadius: BorderRadius.all(Radius.circular(50),),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                titulo,
                style: TextStyle(color: Colors.white, fontSize: 60,),),
              Text(
                descricao,
                style: TextStyle(color: Colors.white, fontSize: 20,),
              ),
              GestureDetector(
                onTap: (){print("funfou");},
                child: Container(
                  padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xff4DA735),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text("Acessar", style: TextStyle(color: Colors.white, fontSize: 30,),),),
              ),
            ],
          ),
        ),
      );
  }
}
