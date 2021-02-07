import 'package:manutencao_parse/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Unidade {
  final String unidade;
  final String id;

  Unidade({this.id, this.unidade});

  Unidade.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        unidade = parseObject.get(KeyUnidadeSelection);

  @override
  String toString() => 'Unidade(unidade: $unidade, id: $id)';
}
