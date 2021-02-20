import 'package:manutencao_parse/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

import 'package:manutencao_parse/models/user.dart';

part 'user_menager_store.g.dart';

class UserMenagerStore = _UserMenagerStore with _$UserMenagerStore;

abstract class _UserMenagerStore with Store {
  _UserMenagerStore() {
    _getCurrentuser();
  }

  @observable
  User user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentuser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }

  Future<void> logout() async {
    await UserRepository().logout();
    setUser(null);
  }
}
