import 'package:cpa_evolution/variaveis.dart';
import 'package:mobx/mobx.dart';

part 'log.store.g.dart';

class LogStore = _LogStore with _$LogStore;

abstract class _LogStore with Store {

  @observable
  String log = log1;

  @action
  void incrementar() {
    log = 'on';
    log1 = log;
  }
}