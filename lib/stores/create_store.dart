import 'package:manutencao_parse/models/category.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/models/unidade.dart';
import 'package:manutencao_parse/repositories/manutencao_repository.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';

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
  String nome = "";

  @action
  void setTitle(String value) => nome = value;

  @computed
  bool get nameIsValid => nome.length >= 3;
  String get nameError {
    if (!showErrors || nameIsValid)
      return null;
    else if (nome.isEmpty)
      return "Campo Obrigatório";
    else
      return "Insira um nome válido";
  }

  @observable
  String observacao = "";

  @action
  void setObservacao(String value) => observacao = value;

  @computed
  bool get observacaoIsValid => observacao.length >= 1;
  String get observacaoError {
    if (!showErrors || observacaoIsValid)
      return null;
    else if (nome.isEmpty)
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

  @observable
  String tensao = "";

  @action
  void setTensao(String value) => tensao = value;

  @computed
  bool get tensaoIsValid => tensao.length >= 0;
  String get tensaoError {
    if (!showErrors || tensaoIsValid)
      return null;
    else if (tensao.isEmpty)
      return "Campo Obrigatório";
    else
      return "Insira uma solução válida";
  }

  @observable
  String corrente = "";

  @action
  void setCorrente(String value) => corrente = value;

  @computed
  bool get correnteIsValid => corrente.length >= 0;
  String get correnteError {
    if (!showErrors || correnteIsValid)
      return null;
    else if (corrente.isEmpty)
      return "Campo Obrigatório";
    else
      return "Insira uma solução válida";
  }

  @observable
  String patrimonio = "";

  @action
  void setPatrimonio(String value) => patrimonio = value;

  @computed
  bool get patrimonioIsValid => patrimonio.length >= 0;
  String get patrimonioError {
    if (!showErrors || patrimonioIsValid)
      return null;
    else if (patrimonio.isEmpty)
      return "Campo Obrigatório";
    else
      return "Insira uma solução válida";
  }

  @observable
  String tag = "";

  @action
  void setTag(String value) => tag = value;

  @computed
  bool get tagIsValid => tag.length >= 0;
  String get tagError {
    if (!showErrors || tagIsValid)
      return null;
    else if (tag.isEmpty)
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

  @observable
  bool loading = false;
  @observable
  String error;

  @action
  Future<void> _send() async {
    final manutencao = Manutencao();

    manutencao.image = images;
    manutencao.nome = nome;
    manutencao.tensao = tensao;
    manutencao.corrente = corrente;
    manutencao.patrimonio = patrimonio;
    manutencao.tag = tag;
    manutencao.category = category;
    manutencao.unidade = unidade;
    manutencao.problema = problema;
    manutencao.solucao = solucao;
    manutencao.observacao = observacao;
    manutencao.user = GetIt.I<UserMenagerStore>().user;

    loading = true;
    try {
      // ignore: unused_local_variable
      final response = await ManutencaoRepository().save(manutencao);
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
