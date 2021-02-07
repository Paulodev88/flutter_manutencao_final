import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:manutencao_parse/repositories/table_keys.dart';

class Category {
  final String id;
  final String description;

  Category({
    this.id,
    this.description,
  });

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        description = parseObject.get(KeyCategoryDescription);

  @override
  String toString() => 'Category(id: $id, description: $description)';
}
