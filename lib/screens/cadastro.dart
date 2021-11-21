import 'dart:convert';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String dropdownValue = 'Aluno';

  Future<void> cadastro(usuario, senha, ra, nome, role) async {
    var bytes = utf8.encode(senha);
    var digest = sha256.convert(bytes);

    Map data = {
      'username': usuario,
      'password': digest.toString(),
      "code": ra,
      "fullName": nome,
      "roleId": role == "Aluno" ? 1 : 2,
    };

    var body = json.encode(data);

    var response = await http.post(
      Uri.parse("http://26.138.176.209:4040/register"),
      body: body,
    );
    setState(() {
      pop_up("Conta cadastrada com sucesso, realize seu login!");
    });

    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Login(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 100),
        ),
      );
    });
  }

  String status = "";

  void pop_up(String status) {
    var pop_up_var = SnackBar(
      content: Text(status),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(pop_up_var);
  }

  final usuario_controller = TextEditingController();
  final senha_controller = TextEditingController();
  final confirmar_senha_controller = TextEditingController();
  final ra_controller = TextEditingController();
  final nome_controller = TextEditingController();

  double largura = 0.5;
  double redutor = 0;

  @override
  void dispose() {
    usuario_controller.dispose();
    senha_controller.dispose();
    confirmar_senha_controller.dispose();
    ra_controller.dispose();
    nome_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        var parentWidth = constraints.maxWidth;
        if (parentWidth < 800) {
          largura = 0.9;
          redutor = 150;
        } else {
          if(parentWidth > 1150){
            largura = 0.5;
            redutor = 30;
          }else{
            largura = 0.7;
            redutor = 75;
          }


        }
        return Column(
          children: [
            Menu("inBetween"),
            Container(

              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(

                        margin: EdgeInsets.fromLTRB(0, 50, 0, 30),
                        child: const Text(
                          "Cadastro",
                          style:
                              TextStyle(fontSize: 80, color: Color(0xff004684)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * largura,
                        padding: EdgeInsets.all(10),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 300 - redutor,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Usuario",
                                          style: TextStyle(
                                              fontSize: 30 - redutor/20,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: TextFormField(
                                            controller: usuario_controller,
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
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 300 - redutor,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "R.A",
                                          style: TextStyle(
                                              fontSize: 30 - redutor/20,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: TextFormField(
                                            controller: ra_controller,
                                            style: const TextStyle(
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
                            Vazio(10, 0),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 300 - redutor,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nome",
                                          style: TextStyle(
                                              fontSize: 30- redutor/20,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: TextFormField(
                                            controller: nome_controller,
                                            style: const TextStyle(
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
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 300 - redutor,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ocupação",
                                          style: TextStyle(
                                              fontSize: 30 - redutor/20,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          width: 300,
                                          height: 50,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          margin:
                                              EdgeInsets.fromLTRB(0, 2, 0, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Color(0xff4DA735),
                                                width: 3),
                                          ),
                                          child: DropdownButton<String>(
                                            value: dropdownValue,
                                            icon: const Icon(
                                                Icons.arrow_downward),
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
                                            items: <String>[
                                              'Aluno',
                                              'Professor',
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
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
                            Vazio(10, 0),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 300 - redutor,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Senha",
                                          style: TextStyle(
                                              fontSize: 20 - redutor/40,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: TextFormField(
                                            controller: senha_controller,
                                            style: const TextStyle(
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
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 300 - redutor,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Confirmar senha",
                                          style: TextStyle(
                                              fontSize: 20 - redutor/40,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: TextFormField(
                                            controller:
                                                confirmar_senha_controller,
                                            style: const TextStyle(
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
                            Vazio(10, 0),
                            GestureDetector(
                              onTap: () {
                                if (senha_controller.text ==
                                    confirmar_senha_controller.text) {
                                  cadastro(
                                      usuario_controller.text,
                                      senha_controller.text,
                                      ra_controller.text,
                                      nome_controller.text,
                                      dropdownValue);
                                } else {
                                  setState(() {
                                    pop_up("confirmação de senha incorreta");
                                  });
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(60, 10, 60, 10),
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
                ],
              ),
            ),
            Rodape(),
          ],
        );
      }),
    );
  }
}
