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
    if (imagesValid)
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
    if (nameIsValid)
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
    if (categoryValid)
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
    if (unidadeValid)
      return null;
    else
      return "Campo Obrigatório";
  }
}
