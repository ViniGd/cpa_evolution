import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Login {

  @observable
  Observable _estado = Observable(false);
  bool get estado => _estado.value;

  @action
  void alternar(_estado){
    switch(_estado){
      case false:
        _estado = true;
        break;
      case true:
        _estado = false;
        break;
    }
  }
}