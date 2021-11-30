import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/social/avaliacao.dart';
import 'package:cpa_evolution/widgets/social/titulo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../variaveis.dart';

class Professores_aval extends StatefulWidget {

  String codigo;
  String nome;

  Professores_aval(this.codigo,this.nome, {Key? key}) : super(key: key);

  @override
  State<Professores_aval> createState() => _Professores_avalState();
}

class _Professores_avalState extends State<Professores_aval> {
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

  Future<void> pegar_aval_professor() async{
    // esta função realiza uma chamada na API para pegar todas as  avaliações
    // de determinado professor para serem buildadas por um listview.builder para gerar a página em questão.

    var response = await http.get(Uri.parse("http://26.138.176.209:4040/users/${widget.codigo}/review"));
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
    pegar_aval_professor().then((value){
      print('Async done');
    });
    super.initState();
  }

  String status = "";

  void pop_up(String status){
    //Esta função recebe uma string, e ativa o widget toast na tela,
    // apresentando a string inserida na função como uma mensagem.
    var pop_up_var = SnackBar(
      content: Text(status),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(pop_up_var);
  }

  Future<void> postar_aval(score,aval,token) async{
    //Esta função realiza uma chamada post na API, enviando o token ativo,
    // a avaliação, o score, e a o que/quem a avaliação se refere.

    Map data = {
      'score':  int.parse(score),
      'feedback' : aval,
    };

    var body = json.encode(data);

    var response = await http.post(Uri.parse("http://26.138.176.209:4040/users/${widget.codigo}/review"),body:body,headers: {"Authorization":token});
    print(response.body);
    pop_up("Avaliação publicada");
  }

  final aval_controller = TextEditingController();

  @override
  void dispose() {
    aval_controller.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        var parentWidth = constraints.maxWidth;
        if (parentWidth < 650) {
          fonte_fix = 4;
          largura = 0.90;
        } else {
          fonte_fix = 0;
          largura = 0.48;
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
                      Titulo(widget.codigo,widget.nome,largura,fonte_fix),
                    ],
                  ),
                ),
                Container(

                    width: MediaQuery.of(context).size.width * largura,
                    height: token_global != "" ? 300 : 100,
                    decoration: const BoxDecoration(
                      color: Color(0xff004684),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child:Column(
                      children: [
                        Text(token_global != "" ? "\nDeixe sua avaliação\n": "\nRegistre-se para avaliar", style: TextStyle(fontSize: 30, color: Colors.white),),
                        Visibility(
                          visible: token_global ==""? false : true,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                            Container(
                              width: MediaQuery.of(context).size.width * (largura-0.1),
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: TextFormField(
                                controller: aval_controller,
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
                                  onTap: (){
                                    postar_aval(dropdownValue, aval_controller.text, token_global);
                                  },
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
                        ),
                      ],
                    ),
                    ),
                Vazio(50, 0),

                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
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
