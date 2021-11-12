import 'package:cpa_evolution/store/log.store.dart';
import 'package:cpa_evolution/widgets/bandeira.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/texto.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cpa_evolution/variaveis.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double fonte_fix = 0;
  LogStore store = LogStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Menu("home"),
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
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Vazio(50, 0),
                    Text(
                      "CPA Evolution",
                      style: TextStyle(
                        color: Color(0xff004684),
                        fontSize: 75-fonte_fix*2,
                      ),
                    ),
                    Vazio(50, 0),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
                                "minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
                                "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia"
                                "deserunt mollit anim id est laborum.",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 22-fonte_fix),
                              ),
                            ]),
                      ),
                    ),
                    Vazio(50, 0),
                    Bandeira(
                      "Matérias",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
                          "minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
                          "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia"
                          "deserunt mollit anim id est laborum.",
                    ),
                    Vazio(50, 0),
                    Bandeira(
                      "Professores",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad"
                          "minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
                          "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui offici"
                          "deserunt mollit anim id est laborum.",
                    ),
                    Vazio(50, 0),
                  ],
                )
              ],
            ),
          );}
        ),
        Rodape(),
      ],
    ));
  }
}
