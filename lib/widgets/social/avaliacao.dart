import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Avaliacao extends StatefulWidget {
  String nome;
  String nota;
  String comentario;

  Avaliacao(this.nome, this.nota, this.comentario);

  @override
  State<Avaliacao> createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  double fonte_fix = 0;
  double largura = 0.48;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var parentWidth = constraints.maxWidth;
      if (parentWidth < 650) {
        fonte_fix = 4;
        largura = 0.95;
      } else {
        fonte_fix = 8;
        largura = 0.48;
      }
      return Visibility(
        visible: widget.nome == "" ? false : true,
        child: Center(
            child: Container(
                width: MediaQuery.of(context).size.width * largura,
                height: widget.nome == "" ? 0 :200,
                decoration: BoxDecoration(
                  color: Color(0xff004684),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        widget.nome,
                        style: TextStyle(color: Colors.white, fontSize: 10+fonte_fix),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Text(
                        widget.nota,
                        style: TextStyle(color: Colors.white, fontSize: 10+fonte_fix),
                      ),
                    ),
                    Positioned(

                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width * largura,
                            child: Text(
                              widget.comentario,
                              style: TextStyle(color: Colors.white,fontSize: 7+fonte_fix),
                            )),
                      ),
                    ),
                  ],
                ))),
      );
    });
  }
}
