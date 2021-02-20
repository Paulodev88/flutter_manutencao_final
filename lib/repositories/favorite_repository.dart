import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/models/user.dart';
import 'package:manutencao_parse/repositories/parse_errors.dart';
import 'package:manutencao_parse/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class FavoriteRepository {
  Future<List<Manutencao>> getFavorites(User user) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyManutencaoTable));

    queryBuilder.whereEqualTo(keyManutencaoOwner, user.id);
    queryBuilder.includeObject([keyFavoriteManutencao, 'manutencao.owner']);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results
          .map((po) => Manutencao.fromParse(po.get(keyFavoriteManutencao)))
          .toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<void> save({Manutencao manutencao, User user}) async {
    final favoriteObject = ParseObject(keyFavoriteTable);

    favoriteObject.set<String>(keyFavoriteOwner, user.id);
    favoriteObject.set<ParseObject>(keyFavoriteManutencao,
        ParseObject(keyManutencaoTable)..set(keyManutencaoId, manutencao.id));

    final response = await favoriteObject.save();
    if (!response.success)
      return Future.error(ParseErrors.getDescription(response.error.code));
  }

  Future<void> delete({Manutencao manutencao, User user}) async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keyFavoriteTable));

      queryBuilder.whereEqualTo(keyFavoriteOwner, user.id);
      queryBuilder.whereEqualTo(keyFavoriteManutencao,
          ParseObject(keyManutencaoTable)..set(keyManutencaoId, manutencao.id));

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final f in response.results as List<ParseObject>) {
          await f.delete();
        }
      }
    } catch (e) {
      return Future.error('Falha ao deletar favorito');
    }
  }
}
