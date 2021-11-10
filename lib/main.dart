import 'package:cpa_evolution/screens/home.dart';
import 'package:cpa_evolution/screens/professores_aval.dart';
import 'package:cpa_evolution/screens/teste.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}