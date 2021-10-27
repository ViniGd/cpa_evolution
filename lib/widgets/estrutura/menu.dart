import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.1,
      color: Color(0xff004684) ,
      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: (){print("menu acionado");},
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff004684),
              ),
              child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 22,)),
            ),
          ),
          
          Text("  |  ", style: TextStyle(color: Colors.grey, fontSize: 22),),

          GestureDetector(
            onTap: (){print("cursos acionado");},
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff004684),
              ),
              child: Text("Cursos", style: TextStyle(color: Colors.white, fontSize: 22,)),
            ),
          ),

          Text("  |  ", style: TextStyle(color: Colors.grey, fontSize: 22),),

          GestureDetector(
            onTap: (){print("prof acionado");},
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff004684),
              ),
              child: Text("Professores", style: TextStyle(color: Colors.white, fontSize: 22,)),
            ),
          ),

          Text("  |  ", style: TextStyle(color: Colors.grey, fontSize: 22),),

          GestureDetector(
            onTap: (){print("login acionado");},
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff004684),
              ),
              child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 22,)),
            ),
          ),


        ],
      ),

    ));
  }
}
