// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreateStore, Store {
  Computed<bool> _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_CreateStore.imagesValid'))
          .value;
  Computed<bool> _$nameIsValidComputed;

  @override
  bool get nameIsValid =>
      (_$nameIsValidComputed ??= Computed<bool>(() => super.nameIsValid,
              name: '_CreateStore.nameIsValid'))
          .value;
  Computed<bool> _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_CreateStore.categoryValid'))
          .value;
  Computed<bool> _$unidadeValidComputed;

  @override
  bool get unidadeValid =>
      (_$unidadeValidComputed ??= Computed<bool>(() => super.unidadeValid,
              name: '_CreateStore.unidadeValid'))
          .value;
  Computed<bool> _$problemaIsValidComputed;

  @override
  bool get problemaIsValid =>
      (_$problemaIsValidComputed ??= Computed<bool>(() => super.problemaIsValid,
              name: '_CreateStore.problemaIsValid'))
          .value;
  Computed<bool> _$solucaoIsValidComputed;

  @override
  bool get solucaoIsValid =>
      (_$solucaoIsValidComputed ??= Computed<bool>(() => super.solucaoIsValid,
              name: '_CreateStore.solucaoIsValid'))
          .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid => (_$formValidComputed ??=
          Computed<bool>(() => super.formValid, name: '_CreateStore.formValid'))
      .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_CreateStore.sendPressed'))
          .value;

  final _$titleAtom = Atom(name: '_CreateStore.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$categoryAtom = Atom(name: '_CreateStore.category');

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

  final _$unidadeAtom = Atom(name: '_CreateStore.unidade');

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

  final _$problemaAtom = Atom(name: '_CreateStore.problema');

  @override
  String get problema {
    _$problemaAtom.reportRead();
    return super.problema;
  }

  @override
  set problema(String value) {
    _$problemaAtom.reportWrite(value, super.problema, () {
      super.problema = value;
    });
  }

  final _$solucaoAtom = Atom(name: '_CreateStore.solucao');

  @override
  String get solucao {
    _$solucaoAtom.reportRead();
    return super.solucao;
  }

  @override
  set solucao(String value) {
    _$solucaoAtom.reportWrite(value, super.solucao, () {
      super.solucao = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_CreateStore.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$_CreateStoreActionController = ActionController(name: '_CreateStore');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCatgory(Category value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setCatgory');
    try {
      return super.setCatgory(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnidade(Unidade value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setUnidade');
    try {
      return super.setUnidade(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProblema(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setProblema');
    try {
      return super.setProblema(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSolucao(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setSolucao');
    try {
      return super.setSolucao(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
category: ${category},
unidade: ${unidade},
problema: ${problema},
solucao: ${solucao},
showErrors: ${showErrors},
imagesValid: ${imagesValid},
nameIsValid: ${nameIsValid},
categoryValid: ${categoryValid},
unidadeValid: ${unidadeValid},
problemaIsValid: ${problemaIsValid},
solucaoIsValid: ${solucaoIsValid},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
