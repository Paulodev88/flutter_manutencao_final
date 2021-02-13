import 'package:manutencao_parse/models/category.dart';
import 'package:manutencao_parse/models/unidade.dart';
import 'package:manutencao_parse/repositories/manutencao_repository.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  _SearchStore() {
    autorun((_) async {
      final novasManutencoes =
          await ManutencaoRepository().getHomeManutencaoList(
        search: search,
        category: category,
        unidade: unidade,
      );
      print(novasManutencoes);
    });
  }
  @observable
  String search = "";

  @action
  void seatSearch(String value) => search = value;

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  Unidade unidade;

  @action
  void setUnidade(Unidade value) => unidade = value;
}
