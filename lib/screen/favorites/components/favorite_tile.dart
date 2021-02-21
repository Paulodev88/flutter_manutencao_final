import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/screen/manutencao/manutecao_scree.dart';
import 'package:manutencao_parse/helpers/extensions.dart';
import 'package:manutencao_parse/stores/favorite_store.dart';

class FavoriteTile extends StatelessWidget {
  FavoriteTile(this.manutencao);

  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();
  final Manutencao manutencao;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => ManutencaoScreen(manutencao)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        height: 135,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Row(
            children: [
              SizedBox(
                height: 135,
                width: 120,
                child: CachedNetworkImage(
                  imageUrl: manutencao.image.isEmpty
                      ? "https://static.thenounproject.com/png/194055-200.png"
                      : manutencao.image.first,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        manutencao.nome,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(manutencao.unidade.unidade),
                      Text(manutencao.user.name),
                      Row(
                        children: [
                          Expanded(
                            child: Text(manutencao.created.formattedDate()),
                          ),
                          GestureDetector(
                            onTap: () =>
                                favoriteStore.toggleFavorite(manutencao),
                            child: Icon(Icons.delete_outline,
                                color: Colors.grey, size: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
