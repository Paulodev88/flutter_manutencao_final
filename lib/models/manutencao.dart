import 'package:manutencao_parse/models/category.dart';
import 'package:manutencao_parse/models/unidade.dart';
import 'package:manutencao_parse/models/user.dart';
import 'package:manutencao_parse/repositories/table_keys.dart';
import 'package:manutencao_parse/repositories/user_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

enum ManutencaoStatus { PROCESSANDO, PENDENTE, CONCLUIDA, DELETADA }

class Manutencao {
  Manutencao.fromParse(ParseObject object) {
    id = object.objectId;
    image = object.get<List>(keyManutencaoImages).map((e) => e.url).toList();
    nome = object.get<String>(keyManutencaoNome);
    tensao = object.get<String>(keyManutencaoTensao);
    corrente = object.get<String>(keyManutencaoCorrente);
    patrimonio = object.get<String>(keyManutencaoPatrimonio);
    tag = object.get<String>(keyManutencaoTag);
    observacao = object.get<String>(keyManutencaoObservacao);
    problema = object.get<String>(keyManutencaoProblema);
    solucao = object.get<String>(keyManutencaoSolucao);
    created = object.createdAt;
    views = object.get<int>(keyManutencaoViews, defaultValue: 0);

    user = UserRepository()
        .mapParseToUser(object.get<ParseUser>(keyManutencaoOwner));
    category =
        Category.fromParse(object.get<ParseObject>(keyManutencaoCategory));
    unidade = Unidade.fromParse(object.get<ParseObject>(keyManutencaoUnidade));
    status = ManutencaoStatus.values[object.get<int>(keyManutencaoStatus)];
  }

  Manutencao();
  String id;
  List image;
  String nome;
  String tensao;
  String corrente;
  String patrimonio;
  String tag;
  String observacao;
  Category category;
  Unidade unidade;
  String problema;
  String solucao;
  ManutencaoStatus status = ManutencaoStatus.CONCLUIDA;
  DateTime created;
  User user;
  int views;
}
