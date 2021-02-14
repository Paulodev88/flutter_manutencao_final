import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/screen/manutencao/components/bottom_bar.dart';
import 'package:manutencao_parse/screen/manutencao/components/description_panel.dart';
import 'package:manutencao_parse/screen/manutencao/components/main_painel.dart';
import 'package:manutencao_parse/screen/manutencao/components/user_panel.dart';

class ManutencaoScreen extends StatelessWidget {
  ManutencaoScreen(this.manutencao);
  final Manutencao manutencao;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Manutenção"),
        centerTitle: true,
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
                    height: 120,
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
