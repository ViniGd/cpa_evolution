import 'package:cpa_evolution/screens/materias_aval.dart';
import 'package:cpa_evolution/screens/professores_aval.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';

class Resumo extends StatefulWidget {
  String codigo;
  String nome;
  String role;

  Resumo(this.codigo, this.nome, this.role, {Key? key}) : super(key: key);

  @override
  State<Resumo> createState() => _ResumoState();
}

class _ResumoState extends State<Resumo> {

  double fonte=20;
  double largura = 0.35;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
      var parentWidth = constraints.maxWidth;
      if(parentWidth < 700){
        fonte = 14;
        largura = 0.8;
      }else{
        fonte = 20;
        largura = 0.35;
      }
      return Visibility(
        visible: widget.nome == "" ? false : true,
        child: Center(
            child: GestureDetector(
              onTap: (){
                if(widget.role == "professores"){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Professores_aval(widget.codigo),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 100),
                    ),
                  );
                }else{
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Materias_aval(widget.codigo),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 100),
                    ),
                  );
                }

              },
              child: Container(
          width: MediaQuery.of(context).size.width * largura,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: const BoxDecoration(
              color: Color(0xff004684),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: Text(
                    "${widget.nome}",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fonte,
                    ),
                  ),
                ),
              ],
          ),
        ),
            )),
      );
    });
  }
}
