import 'package:cpa_evolution/screens/cadastro.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';
import 'package:cpa_evolution/store/log.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LogStore store = LogStore();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu("login"),
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 80, color: Color(0xff004684)),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.3,
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
                      Vazio(50,0),
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
                                obscureText: true,
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
                      Vazio(50,0),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => Cadastro(),
                              transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 100),
                            ),
                          );
                        },
                          child: const Text("Não tem uma conta? clique aqui e cadastre-se",style: TextStyle(fontSize: 20,color: Colors.white),)),
                      Vazio(50,0),
                      GestureDetector(
                        onTap:(){store.incrementar();},
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
                            "Acessar",
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
