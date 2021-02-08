import 'dart:io';

import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/repositories/parse_errors.dart';
import 'package:manutencao_parse/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

class ManutencaoRepository {
  Future<void> save(Manutencao manutencao) async {
    try {
      final parseImages = await saveImages(manutencao.image);

      final parseUser = ParseUser('', '', '')
        ..set(KeyUserId, manutencao.user.id);

      final manutencaoObject = ParseObject(keyManutencaoTable);

      final parseAcl = ParseACL(owner: parseUser);

      parseAcl.setPublicReadAccess(allowed: true);
      parseAcl.setPublicWriteAccess(allowed: false);

      manutencaoObject.setACL(parseAcl);

      manutencaoObject.set<String>(keyManutencaoNome, manutencao.nome);
      manutencaoObject.set<String>(keyManutencaoTensao, manutencao.tensao);
      manutencaoObject.set<String>(keyManutencaoCorrente, manutencao.corrente);
      manutencaoObject.set<String>(
          keyManutencaoPatrimonio, manutencao.patrimonio);
      manutencaoObject.set<String>(keyManutencaoTag, manutencao.tag);
      manutencaoObject.set<String>(keyManutencaoSolucao, manutencao.solucao);
      manutencaoObject.set<int>(keyManutencaoStatus, manutencao.status.index);
      manutencaoObject.set<String>(keyManutencaoProblema, manutencao.problema);

      manutencaoObject.set<List<ParseFile>>(keyManutencaoImages, parseImages);
      manutencaoObject.set<ParseUser>(keyManutencaoOwner, parseUser);
      manutencaoObject.set<ParseObject>(
          keyManutencaoCategory,
          ParseObject(KeyCategoryTable)
            ..set(KeyCategoryId, manutencao.category.id));
      manutencaoObject.set<ParseObject>(
          keyManutencaoUnidade,
          ParseObject(KeyUnidadeTable)
            ..set(KeyCategoryId, manutencao.unidade.id));

      final response = await manutencaoObject.save();
      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error.code));
      }
    } catch (e) {
      print(e);
      return Future.error('Falha ao salvar anúncio');
    }
  }

  Future<List<ParseFile>> saveImages(List images) async {
    final parseImages = <ParseFile>[];

    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();
          if (!response.success) {
            return Future.error(
                ParseErrors.getDescription(response.error.code));
          }
          parseImages.add(parseFile);
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(image);
          parseFile.url = image;
          parseImages.add(parseFile);
        }
      }

      return parseImages;
    } catch (e) {
      return Future.error('Falha ao salvar imagens');
    }
  }
}
