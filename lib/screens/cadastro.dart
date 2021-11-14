import 'dart:convert';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String dropdownValue = 'Aluno';


  Future<void> cadastro(usuario,senha,ra,nome,role) async{

    var bytes = utf8.encode(senha);
    var digest = sha256.convert(bytes);

    Map data = {
      'username': usuario,
      'password' : digest.toString(),
      "code" : ra,
      "fullName" : nome,
      "roleId" : role,
    };

    var body = json.encode(data);

    var response = await http.post(Uri.parse("http://26.138.176.209:4040/register"),body:body,);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu("inBetween"),
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: const Text(
                    "Cadastro",
                    style: TextStyle(fontSize: 80, color: Color(0xff004684)),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    color: Color(0xff004684),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Usuario", style: TextStyle(fontSize: 30,color: Colors.white),),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: TextFormField(style: const TextStyle(
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
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("R.A", style: TextStyle(fontSize: 30,color: Colors.white),),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: TextFormField(style: const TextStyle(
                                      fontFamily: 'balsamiq',
                                      fontSize: 15,
                                    ),
                                      decoration: const InputDecoration(
                                        hintText: "R.A",
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Vazio(50,0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nome", style: TextStyle(fontSize: 30,color: Colors.white),),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: TextFormField(style: const TextStyle(
                                      fontFamily: 'balsamiq',
                                      fontSize: 15,
                                    ),
                                      decoration: const InputDecoration(
                                        hintText: "nome",
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
                                ],
                              ),
                            ),
                            Container(
                              width: 300,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ocupação", style: TextStyle(fontSize: 30,color: Colors.white),),
                              Container(
                                width: 300,
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
                                  items: <String>['Aluno', 'Professor',]
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Vazio(50,0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Senha", style: TextStyle(fontSize: 30,color: Colors.white),),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: TextFormField(style: const TextStyle(
                                      fontFamily: 'balsamiq',
                                      fontSize: 15,
                                    ),
                                      decoration: const InputDecoration(
                                        hintText: "******",
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
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Confirmar senha", style: TextStyle(fontSize: 30,color: Colors.white),),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: TextFormField(style: const TextStyle(
                                      fontFamily: 'balsamiq',
                                      fontSize: 15,
                                    ),
                                      decoration: const InputDecoration(
                                        hintText: "******",
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Vazio(50,0),
                      GestureDetector(
                        onTap: () {
                          print("funfou");
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xff4DA735),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Rodape(),
        ],
      ),
    );
  }
}
