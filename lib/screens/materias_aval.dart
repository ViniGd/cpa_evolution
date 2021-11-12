import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/social/avaliacao.dart';
import 'package:cpa_evolution/widgets/social/titulo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Materias_aval extends StatefulWidget {
  const Materias_aval({Key? key}) : super(key: key);

  @override
  State<Materias_aval> createState() => _Materias_avalState();
}

class _Materias_avalState extends State<Materias_aval> {
  double fonte_fix = 0;
  var itens = [
    [

    ],
    [

    ],
    [

    ],
  ];

  int i = 0;
  double largura = 0.48;
  String dropdownValue = '0';

  Future<void> pegar_aval_materias() async{
    var response = await http.get(Uri.parse("http://26.138.176.209:4040/subjects/ECM251/review"));
    var json = jsonDecode(response.body);
    var j = 0;
    setState(() {
      for( var i = 0 ; i < json.length; i++ ){
        try {

          if(j < 3){
            itens[j].add([json[i]["reviewerName"],json[i]["score"],json[i]["feedback"]]);
            j = j+1;
          }else{
            j=0;
            itens[j].add([json[i]["reviewerName"],json[i]["score"],json[i]["feedback"]]);
          }


        } catch(e) {
          break;
        }
        print(itens);
      }
    });


  }

  @override
  void initState() {
    pegar_aval_materias().then((value){
      print('Async done');
    });
    super.initState();
  }


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
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color(0xff004684),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child:Column(
                      children: [
                        Text("\nDeixe sua avaliação\n", style: TextStyle(fontSize: 30, color: Colors.white),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              width: MediaQuery.of(context).size.width * (largura-0.1),
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: TextFormField(
                                maxLines: 3,
                                maxLength: 200,
                                keyboardType: TextInputType.multiline,
                                style: const TextStyle(
                                  fontFamily: 'balsamiq',
                                  fontSize: 15,
                                ),
                                decoration: const InputDecoration(
                                  hintText: "Avaliação",
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text("Score : ", style: TextStyle(fontSize: 20,color: Colors.white),),
                                Container(
                                  width: 80,
                                  height: 50,
                                  margin: EdgeInsets.fromLTRB(5, 2, 0, 0),
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
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),

                                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                                    height: 50-fonte_fix*2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4DA735),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Text("Enviar", style: TextStyle(color: Colors.white, fontSize: 20-fonte_fix*1.5,),),),
                                ),

                              ],
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
