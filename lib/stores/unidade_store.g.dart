// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnidadeStore on _UnidadeStore, Store {
  Computed<List<Unidade>> _$allUnidadeListComputed;

  @override
  List<Unidade> get allUnidadeList => (_$allUnidadeListComputed ??=
          Computed<List<Unidade>>(() => super.allUnidadeList,
              name: '_UnidadeStore.allUnidadeList'))
      .value;

  final _$errorAtom = Atom(name: '_UnidadeStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_UnidadeStoreActionController =
      ActionController(name: '_UnidadeStore');

  @override
  void setUnidades(List<Unidade> unidades) {
    final _$actionInfo = _$_UnidadeStoreActionController.startAction(
        name: '_UnidadeStore.setUnidades');
    try {
      return super.setUnidades(unidades);
    } finally {
      _$_UnidadeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_UnidadeStoreActionController.startAction(
        name: '_UnidadeStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_UnidadeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
allUnidadeList: ${allUnidadeList}
    ''';
  }
}
