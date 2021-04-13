import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/componets/drawer/custom_Drawer.dart';
import 'package:manutencao_parse/componets/empty_card.dart';
import 'package:manutencao_parse/screen/favorites/components/favorite_tile.dart';
import 'package:manutencao_parse/stores/favorite_store.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({this.hideDrawer = false});
  final bool hideDrawer;
  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[900],
              Colors.blue[200],
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Favoritos"),
            centerTitle: true,
          ),
          drawer: hideDrawer ? null : CustomDrawer(),
          body: Observer(builder: (_) {
            if (favoriteStore.favoriteList.isEmpty)
              return EmptyCard("Nenhuma manutenção favoritada");

            return ListView.builder(
              padding: const EdgeInsets.all(2),
              itemCount: favoriteStore.favoriteList.length,
              itemBuilder: (_, index) =>
                  FavoriteTile(favoriteStore.favoriteList[index]),
            );
          }),
        ),
      ),
    );
  }
}
