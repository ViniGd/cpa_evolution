
import 'package:cpa_evolution/screens/home.dart';
import 'package:cpa_evolution/screens/login.dart';
import 'package:cpa_evolution/screens/materias.dart';
import 'package:cpa_evolution/screens/professores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  String atual;

  Menu(this.atual, {Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool loginBool = false;

  bool professoresBool = false;

  bool materiasBool = false;

  bool homeBool = false;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => print(""));
  }

  @override
  Widget build(BuildContext context) {
    switch (this.widget.atual){
      case "professores":
        professoresBool = true;
        break;
      case "login":
        loginBool = true;
        break;
      case "materias":
        materiasBool = true;
        break;
      case "home":
        homeBool = true;
        break;

    }
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      color: const Color(0xff004684),
      padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => Home(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 100),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff004684),
              ),
              child: Text("Home",
                  style: TextStyle(
                    color: homeBool ? const Color(0xff4DA735) :Colors.white,
                    fontSize: homeBool ? 24 :22,
                  )),
            ),
          ),
          const Text(
            "  |  ",
            style: TextStyle(color: Colors.grey, fontSize: 22),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => Materias(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 100),
                ),
              );

            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff004684),
              ),
              child: Text("Materias",
                  style: TextStyle(
                    color: materiasBool ? const Color(0xff4DA735) :Colors.white,
                    fontSize: materiasBool ? 24 : 22,
                  )),
            ),
          ),
          const Text(
            "  |  ",
            style: TextStyle(color: Colors.grey, fontSize: 22),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => Professores(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 100),
                ),
              );

            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff004684),
              ),
              child: Text("Professores",
                  style: TextStyle(
                    color: professoresBool ? const Color(0xff4DA735) :Colors.white,
                    fontSize: professoresBool ? 24 : 22,
                  )),
            ),
          ),
          const Text(
            "  |  ",
            style: TextStyle(color: Colors.grey, fontSize: 22),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => Login(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 100),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff004684),
              ),
              child: Text("Login",
                  style: TextStyle(
                    color: loginBool ? const Color(0xff4DA735) :Colors.white,
                    fontSize: loginBool ? 24: 22,
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
