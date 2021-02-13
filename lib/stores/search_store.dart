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
        final newManutencoes =
            await ManutencaoRepository().getHomeManutencaoList(
          search: search,
          category: category,
          unidade: unidade,
          page: page,
        );
        addNewManutencao(newManutencoes);

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
  void setSearch(String value) {
    search = value;
    resetPage();
  }

  @observable
  Category category;

  @action
  void setCategory(Category value) {
    category = value;
    resetPage();
  }

  @observable
  Unidade unidade;

  @action
  void setUnidade(Unidade value) {
    unidade = value;
    resetPage();
  }

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  int page = 0;

  @action
  void loadNextPage() {
    page++;
  }

  @observable
  bool lastPage = false;

  @action
  void addNewManutencao(List<Manutencao> newManutencoes) {
    if (newManutencoes.length < 20) lastPage = true;
    manutencaoList.addAll(newManutencoes);
  }

  @computed
  int get intemCount =>
      lastPage ? manutencaoList.length : manutencaoList.length + 1;

  void resetPage() {
    page = 0;
    manutencaoList.clear();
    lastPage = false;
  }

  @computed
  bool get showProgress => loading && manutencaoList.isEmpty;
}
