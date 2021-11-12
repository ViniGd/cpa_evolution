import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/social/resumo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Materias extends StatefulWidget {
  const Materias({Key? key}) : super(key: key);

  @override
  State<Materias> createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  double fonte_fix =0;
  var itens = [
    [
    ],
    [
    ],
    [
    ],
    [
    ],
    [
    ]
  ];
  int i = 0;

  String id ="";
  Future<void> pegar_materias() async{
    var response = await http.get(Uri.parse("http://26.138.176.209:4040/subjects"));
    var json = jsonDecode(response.body);
    var j = 0;
    setState(() {
      for( var i = 0 ; i < json.length; i++ ){
        try {

            if(j < 5){
              itens[j].add([json[i]["code"],json[i]["name"]]);
              j = j+1;
            }else{
              j=0;
              itens[j].add([json[i]["code"],json[i]["name"]]);
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
    pegar_materias().then((value){
      print('Async done');
    });
    super.initState();
  }

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
                        height: MediaQuery.of(context).size.height*0.4,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ListView.builder(
                          itemCount: itens.length,
                          itemBuilder: (context, index) {
                            try {
                              return ListTile(
                                title: Resumo(
                                  itens[index][i][0].toString(),
                                  itens[index][i][1].toString(),
                                ),
                              );
                            } catch (e) {
                              return ListTile(
                                title: Resumo(
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
