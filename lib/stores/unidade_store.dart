import 'package:manutencao_parse/models/unidade.dart';
import 'package:manutencao_parse/repositories/unidade_repository.dart';
import 'package:mobx/mobx.dart';

part 'unidade_store.g.dart';

class UnidadeStore = _UnidadeStore with _$UnidadeStore;

abstract class _UnidadeStore with Store {
  _UnidadeStore() {
    _loadUnidades();
  }

  ObservableList<Unidade> unidadeList = ObservableList<Unidade>();

  @computed
  List<Unidade> get allUnidadeList =>
      List.from(unidadeList)..insert(0, Unidade(id: '*', unidade: 'Todas'));

  @action
  void setUnidades(List<Unidade> unidades) {
    unidadeList.clear();
    unidadeList.addAll(unidades);
  }

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadUnidades() async {
    try {
      final unidades = await UnidadeRepository().getList();
      setUnidades(unidades);
    } catch (e) {
      setError(e);
    }
  }
}
