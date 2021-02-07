import 'package:manutencao_parse/models/category.dart';
import 'package:manutencao_parse/models/unidade.dart';
import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList images = ObservableList();

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imageError {
    if (!showErrors || imagesValid)
      return null;
    else
      return "Insira imagens";
  }

  @observable
  String title = "";

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get nameIsValid => title.length >= 3;
  String get nameError {
    if (!showErrors || nameIsValid)
      return null;
    else if (title.isEmpty)
      return "Campo Obrigatório";
    else
      return "Insira um nome válido";
  }

  @observable
  Category category;
  @action
  void setCatgory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;
  String get categoryError {
    if (!showErrors || categoryValid)
      return null;
    else
      return "Campo Obrigatório";
  }

  @observable
  Unidade unidade;
  @action
  void setUnidade(Unidade value) => unidade = value;

  @computed
  bool get unidadeValid => unidade != null;
  String get unidadeError {
    if (!showErrors || unidadeValid)
      return null;
    else
      return "Campo Obrigatório";
  }

  @observable
  String problema = "";

  @action
  void setProblema(String value) => problema = value;

  @computed
  bool get problemaIsValid => problema.length >= 3;
  String get probelmaError {
    if (!showErrors || problemaIsValid)
      return null;
    else if (problema.isEmpty)
      return "Campo Obrigatório";
    else
      return "Insira um problema válido";
  }

  @observable
  String solucao = "";

  @action
  void setSolucao(String value) => solucao = value;

  @computed
  bool get solucaoIsValid => solucao.length >= 3;
  String get solucaoError {
    if (!showErrors || solucaoIsValid)
      return null;
    else if (solucao.isEmpty)
      return "Campo Obrigatório";
    else
      return "Insira uma solução válida";
  }

  @computed
  bool get formValid =>
      imagesValid &&
      nameIsValid &&
      categoryValid &&
      unidadeValid &&
      problemaIsValid &&
      solucaoIsValid;

  @computed
  Function get sendPressed => formValid ? _send : null;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  void _send() {}
}
