import 'package:manutencao_parse/models/category.dart';
import 'package:manutencao_parse/models/unidade.dart';
import 'package:manutencao_parse/models/user.dart';

enum ManutencaoStatus { PROCESSANDO, PENDENTE, CONCLUIDA, DELETADA }

class Manutencao {
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
  ManutencaoStatus status = ManutencaoStatus.PENDENTE;
  DateTime created;
  User user;
  int views;
}
