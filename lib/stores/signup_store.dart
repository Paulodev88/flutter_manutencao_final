import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 2;
  String get nameError {
    if (name == null || nameValid)
      return null;
    else
      return "Campo Obrigatório!";
  }
}
