import 'package:manutencao_parse/models/category.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  @observable
  String search = "";

  @action
  void seatSearch(String value) => search = value;

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;
}
