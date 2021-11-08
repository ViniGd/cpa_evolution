import 'package:cpa_evolution/widgets/bandeira.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/texto.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Menu("home"),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Vazio(50,0),
                  const Text(
                    "CPA Evolution",
                    style: TextStyle(
                      color: Color(0xff004684),
                      fontSize: 75,
                    ),
                  ),
                  Vazio(50,0),
                  Texto(),
                  Vazio(50,0),
                  Bandeira(
                    "Matérias",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
                        "minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
                        "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia"
                        "deserunt mollit anim id est laborum.",
                  ),
                  Vazio(50,0),
                  Bandeira(
                    "Professores",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad"
                        "minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
                        "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui offici"
                        "deserunt mollit anim id est laborum.",
                  ),
                  Vazio(50,0),

                ],
              )
      ],
    ),
            ),
            Rodape(),
          ],
        ));
  }
}
