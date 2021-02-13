// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  Computed<int> _$intemCountComputed;

  @override
  int get intemCount =>
      (_$intemCountComputed ??= Computed<int>(() => super.intemCount,
              name: '_SearchStore.intemCount'))
          .value;
  Computed<bool> _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_SearchStore.showProgress'))
          .value;

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

  final _$errorAtom = Atom(name: '_SearchStore.error');

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

  final _$loadingAtom = Atom(name: '_SearchStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$pageAtom = Atom(name: '_SearchStore.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$lastPageAtom = Atom(name: '_SearchStore.lastPage');

  @override
  bool get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(bool value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  final _$_SearchStoreActionController = ActionController(name: '_SearchStore');

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setSearch');
    try {
      return super.setSearch(value);
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
  void setError(String value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadNextPage() {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.loadNextPage');
    try {
      return super.loadNextPage();
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewManutencao(List<Manutencao> newManutencoes) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.addNewManutencao');
    try {
      return super.addNewManutencao(newManutencoes);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
category: ${category},
unidade: ${unidade},
error: ${error},
loading: ${loading},
page: ${page},
lastPage: ${lastPage},
intemCount: ${intemCount},
showProgress: ${showProgress}
    ''';
  }
}
