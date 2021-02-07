import 'package:manutencao_parse/models/unidade.dart';
import 'package:manutencao_parse/repositories/parse_errors.dart';
import 'package:manutencao_parse/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UnidadeRepository {
  Future<List<Unidade>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(KeyUnidadeTable))
      ..orderByAscending(KeyUnidadeSelection);

    final response = await queryBuilder.query();

    if (response.success) {
      return response.results.map((p) => Unidade.fromParse(p)).toList();
    } else {
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}
