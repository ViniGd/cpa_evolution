import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/social/avaliacao.dart';
import 'package:cpa_evolution/widgets/social/score.dart';
import 'package:cpa_evolution/widgets/social/titulo.dart';
import 'package:cpa_evolution/widgets/texto.dart';
import 'package:flutter/material.dart';

class Professores_aval extends StatefulWidget {
  const Professores_aval({Key? key}) : super(key: key);

  @override
  State<Professores_aval> createState() => _Professores_avalState();
}

class _Professores_avalState extends State<Professores_aval> {
  double fonte_fix = 0;
  var itens = [
    [
      ["ETE-404 ", "Teste 1", "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"],
      ["ETE-505", "Teste 2", "1"]
    ],
    [
      ["ETE-505", "Teste 2", "1"]
    ],
    [
      ["ETE-305", "Teste 3", "4"]
    ],
  ];

  int i = 0;
  double largura = 0.48;
  String dropdownValue = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        var parentWidth = constraints.maxWidth;
        if (parentWidth < 650) {
          fonte_fix = 6;
          double largura = 0.90;
        } else {
          fonte_fix = 0;
          double largura = 0.48;
        }
        return ListView(
          children: [
            Menu("inBetween"),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Titulo("curso", "codigomat", "nomemat"),
                    ],
                  ),
                ),
                Visibility(
                  visible: true,
                  child: Container(
                      width: MediaQuery.of(context).size.width * largura,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Color(0xff004684),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child:Column(
                        children: [
                          Text("Deixe sua avaliação", style: TextStyle(fontSize: 30, color: Colors.white),),
                          Row(children: [

                            Container(
                              width: 300,
                              height: 200,
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                style: const TextStyle(
                                fontFamily: 'balsamiq',
                                fontSize: 15,
                              ),
                                decoration: const InputDecoration(
                                  hintText: "Usuario",
                                  filled: true,
                                  fillColor: Color(0xffffffff),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: Color(0xff4DA735),

                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),

                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,

                                      color: Color(0xff4DA735),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),),),
                            ),

                            Container(
                              width: 80,
                              height: 50,
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xff4DA735),width: 3),

                              ),

                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 20,
                                elevation: 16,
                                style: const TextStyle(),
                                underline: Container(
                                  height: 0,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>['0','1','2','3','4','5','6','7','8','9','10']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),

                          ],),
                        ],
                      ),
                      ),
                ),
                Vazio(50, 0),

                Container(
                  height: 200 * 3.2,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ListView.builder(
                    itemCount: itens.length,
                    itemBuilder: (context, index) {
                      try {
                        return ListTile(
                          title: Avaliacao(
                            itens[index][i][0].toString(),
                            itens[index][i][1].toString(),
                            itens[index][i][2].toString(),
                          ),
                        );
                      } catch (e) {
                        return ListTile(
                          title: Avaliacao(
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
                      onTap: () {
                        setState(() {
                          if (i == 0) {
                          } else {
                            i = i - 1;
                          }
                        });
                      },
                      child: const Icon(Icons.arrow_left_rounded,
                          size: 100, color: Color(0xff004684)),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (i == itens[0].length - 1) {
                          } else {
                            i = i + 1;
                          }
                        });
                      },
                      child: const Icon(Icons.arrow_right_rounded,
                          size: 100, color: Color(0xff004684)),
                    ),
                  ],
                ),
              ],
            ),
            Rodape(),
          ],
        );
      }),
    );
  }
}
