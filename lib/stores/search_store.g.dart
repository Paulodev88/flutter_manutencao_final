// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  final _$searchAtom = Atom(name: '_SearchStore.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$categoryAtom = Atom(name: '_SearchStore.category');

  @override
  Category get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$unidadeAtom = Atom(name: '_SearchStore.unidade');

  @override
  Unidade get unidade {
    _$unidadeAtom.reportRead();
    return super.unidade;
  }

  @override
  set unidade(Unidade value) {
    _$unidadeAtom.reportWrite(value, super.unidade, () {
      super.unidade = value;
    });
  }

  final _$_SearchStoreActionController = ActionController(name: '_SearchStore');

  @override
  void seatSearch(String value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.seatSearch');
    try {
      return super.seatSearch(value);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnidade(Unidade value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setUnidade');
    try {
      return super.setUnidade(value);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
category: ${category},
unidade: ${unidade}
    ''';
  }
}
