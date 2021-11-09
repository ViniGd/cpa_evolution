import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/social/resumo.dart';
import 'package:flutter/material.dart';

class Materias extends StatefulWidget {
  const Materias({Key? key}) : super(key: key);

  @override
  State<Materias> createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  double fonte_fix =0;
  var itens = [
    [
      ["ETE-404 texto longo pra caralho", "Teste 1", "10"],
      ["ETE-505", "Teste 2", "1"]
    ],
    [
      ["ETE-505", "Teste 2", "1"]
    ],
    [
      ["ETE-305", "Teste 3", "4"]
    ],
    [
      ["ETE-235", "Teste 4", "2"]
    ],
    [
      ["ETE-666", "Teste 5", "7"]
    ]
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu("materias"),
          LayoutBuilder(
              builder: (context, constraints) {
                var parentWidth = constraints.maxWidth;
                if(parentWidth < 650){
                  fonte_fix = 6;
                }else{
                  fonte_fix = 0;
                }
                return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: Text(
                      "Materias",
                      style: TextStyle(fontSize: 80-fonte_fix*2  , color: const Color(0xff004684)),
                    ),
                  ),
                  Container(
                    height: 80*5.5,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ListView.builder(
                      itemCount: itens.length,
                      itemBuilder: (context, index) {
                        try {
                          return ListTile(
                            title: Resumo(
                              itens[index][i][0].toString(),
                              itens[index][i][1].toString(),
                              itens[index][i][2].toString(),
                            ),
                          );
                        } catch (e) {
                          return ListTile(
                            title: Resumo(
                              "",
                              "",
                              "",
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(i == 0){

                            }else{
                              i = i-1;
                            }

                          });
                        },
                        child: const Icon(Icons.arrow_left_rounded,size: 100, color: Color(0xff004684)),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(i == itens[0].length-1){

                            }else{
                              i = i+1;
                            }
                          });
                        },
                        child: const Icon(Icons.arrow_right_rounded,size: 100, color: Color(0xff004684)),
                      ),
                    ],
                  ),
                ],
              ),
            );
  }),
          Rodape(),
        ],
      ),
    );
  }
}
