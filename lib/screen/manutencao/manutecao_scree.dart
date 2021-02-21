import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/screen/manutencao/components/bottom_bar.dart';
import 'package:manutencao_parse/screen/manutencao/components/description_panel.dart';
import 'package:manutencao_parse/screen/manutencao/components/main_painel.dart';
import 'package:manutencao_parse/screen/manutencao/components/user_panel.dart';
import 'package:manutencao_parse/stores/favorite_store.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';

class ManutencaoScreen extends StatelessWidget {
  ManutencaoScreen(this.manutencao);
  final Manutencao manutencao;
  final UserMenagerStore userMenagerStore = GetIt.I<UserMenagerStore>();
  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Manutenção"),
        centerTitle: true,
        actions: [
          if (manutencao.status == ManutencaoStatus.CONCLUIDA &&
              userMenagerStore.isLoggedIn)
            Observer(builder: (_) {
              return IconButton(
                  icon: Icon(favoriteStore.favoriteList
                          .any((m) => m.id == manutencao.id)
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () => favoriteStore.toggleFavorite(manutencao));
            })
        ],
      ),
      body: Stack(children: [
        ListView(
          children: [
            Container(
              height: 300,
              child: Carousel(
                images: manutencao.image
                    .map((url) => CachedNetworkImageProvider(url))
                    .toList(),
                dotSize: 4,
                dotBgColor: Colors.transparent,
                dotColor: Colors.blue,
                autoplay: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainPainel(manutencao),
                  Divider(
                    color: Colors.grey[500],
                  ),
                  DescriptionPanel(manutencao),
                  Divider(
                    color: Colors.grey[500],
                  ),
                  UserPanel(manutencao),
                  SizedBox(
                    height: manutencao.status == ManutencaoStatus.PENDENTE
                        ? 16
                        : 120,
                  )
                ],
              ),
            )
          ],
        ),
        BottomBar(manutencao),
      ]),
    );
  }
}
