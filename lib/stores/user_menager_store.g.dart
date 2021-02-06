// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_menager_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserMenagerStore on _UserMenagerStore, Store {
  Computed<bool> _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_UserMenagerStore.isLoggedIn'))
          .value;

  final _$userAtom = Atom(name: '_UserMenagerStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_UserMenagerStoreActionController =
      ActionController(name: '_UserMenagerStore');

  @override
  void setUser(User value) {
    final _$actionInfo = _$_UserMenagerStoreActionController.startAction(
        name: '_UserMenagerStore.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserMenagerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
