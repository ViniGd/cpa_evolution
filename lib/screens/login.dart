import 'dart:convert';
import 'package:cpa_evolution/screens/cadastro.dart';
import 'package:cpa_evolution/widgets/estrutura/menu.dart';
import 'package:cpa_evolution/widgets/estrutura/rodape.dart';
import 'package:cpa_evolution/widgets/estrutura/vazio.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:cpa_evolution/variaveis.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Future<void> login(usuario,senha) async{

    var bytes = utf8.encode(senha);
    var digest = sha256.convert(bytes);

    Map data = {
      'username': usuario,
      'password' : digest.toString(),
    };

    var body = json.encode(data);

    var response = await http.post(Uri.parse("http://26.138.176.209:4040/login"),body:body,);
    var jaison = jsonDecode(response.body);
    if(jaison == ""){
      setState(() {
        pop_up("Usuario ou senha incorreta");
      });
    }else{
      var token = "Bearer " + jaison["token"];
      token_global = token;
      pop_up("Login realizado com sucesso");

    }


  }

  String status = "";

  void pop_up(String status){
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

  @override
  void dispose() {
    usuario_controller.dispose();
    senha_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu("login"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: const Text(
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
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Usuario", style: const TextStyle(fontSize: 30,color: Colors.white),),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                                  ),),),
                            ),
                          ],
                        ),
                      ),
                      Vazio(50,0),
                      SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Senha", style: TextStyle(fontSize: 30,color: Colors.white),),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: TextFormField(
                                controller: senha_controller,
                                style: const TextStyle(
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
                              pageBuilder: (c, a1, a2) => const Cadastro(),
                              transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                              transitionDuration: const Duration(milliseconds: 100),
                            ),
                          );
                        },
                          child: const Text("Não tem uma conta? clique aqui e cadastre-se",style: TextStyle(fontSize: 20,color: Colors.white),)),
                      Vazio(50,0),
                      GestureDetector(
                        onTap:(){login(usuario_controller.text,senha_controller.text);},
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
          

          const Rodape(),
        ],
      ),
    );
  }

}
