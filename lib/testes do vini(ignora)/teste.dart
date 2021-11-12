import 'package:cpa_evolution/screens/cadastro.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';
import 'package:cpa_evolution/store/log.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Teste extends StatelessWidget {
  final store = LogStore();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => Text(
                  '${store.log}',
              ),
            ),
            GestureDetector(onTap:(){store.incrementar();},child: Text('aperta'))
            ],
        ),
      ),
    );

  }
}
