import 'package:manutencao_parse/models/category.dart';
import 'package:manutencao_parse/models/unidade.dart';
import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList images = ObservableList();

  @observable
  Category category;
  @action
  void setCatgory(Category value) => category = value;

  @observable
  Unidade unidade;
  @action
  void setUnidade(Unidade value) => unidade = value;
}
