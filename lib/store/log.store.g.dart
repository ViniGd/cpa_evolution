// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LogStore on _LogStore, Store {
  final _$logAtom = Atom(name: '_LogStore.contador');

  @override
  String get log {
    _$logAtom.reportRead();
    return super.log;
  }

  @override
  set log(String value) {
    _$logAtom.reportWrite(value, super.log, () {
      super.log = value;
    });
  }

  final _$_LogStoreActionController =
  ActionController(name: '_ContadorStore');

  @override
  void incrementar() {
    final _$actionInfo = _$_LogStoreActionController.startAction(
        name: '_ContadorStore.incrementar');
    try {
      return super.incrementar();
    } finally {
      _$_LogStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
log: ${log}
    ''';
  }
}