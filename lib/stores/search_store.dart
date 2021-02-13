import 'package:manutencao_parse/models/category.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/models/unidade.dart';
import 'package:manutencao_parse/repositories/manutencao_repository.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  _SearchStore() {
    autorun((_) async {
      try {
        setLoading(true);
        final novasManutencoes =
            await ManutencaoRepository().getHomeManutencaoList(
          search: search,
          category: category,
          unidade: unidade,
        );
        manutencaoList.clear();
        manutencaoList.addAll(novasManutencoes);
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e);
      }
    });
  }

  ObservableList<Manutencao> manutencaoList = ObservableList<Manutencao>();

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

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;
}
