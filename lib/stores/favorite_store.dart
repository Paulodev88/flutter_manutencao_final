import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/repositories/favorite_repository.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';
import 'package:mobx/mobx.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  _FavoriteStore() {
    reaction((_) => userManagerStore.isLoggedIn, (_) {
      _getFavoriteList();
    });
  }

  final UserMenagerStore userManagerStore = GetIt.I<UserMenagerStore>();

  ObservableList<Manutencao> favoriteList = ObservableList<Manutencao>();

  @action
  Future<void> _getFavoriteList() async {
    try {
      favoriteList.clear();
      final favorites =
          await FavoriteRepository().getFavorites(userManagerStore.user);
      favoriteList.addAll(favorites);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> toggleFavorite(Manutencao manutencao) async {
    try {
      if (favoriteList.any((a) => a.id == manutencao.id)) {
        favoriteList.removeWhere((a) => a.id == manutencao.id);
        await FavoriteRepository()
            .delete(manutencao: manutencao, user: userManagerStore.user);
      } else {
        favoriteList.add(manutencao);
        await FavoriteRepository()
            .save(manutencao: manutencao, user: userManagerStore.user);
      }
    } catch (e) {
      print(e);
    }
  }
}
