import 'package:flutter/material.dart';
import 'package:manutencao_parse/componets/drawer/page_Tile.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/stores/page_store.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Text(
          "Manutenções \nda SCI",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.purple[900]),
          textAlign: TextAlign.center,
        ),
        PageTile(
          label: "Manutenções",
          iconData: Icons.format_list_bulleted,
          onTap: () {
            pageStore.setPage(0);
          },
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: "Inserir Manutenção",
          iconData: Icons.edit,
          onTap: () {
            pageStore.setPage(1);
          },
          highlighted: pageStore.page == 1,
        ),
        PageTile(
            label: "Observações",
            iconData: Icons.chat_outlined,
            onTap: () {
              pageStore.setPage(2);
            },
            highlighted: pageStore.page == 2),
        PageTile(
          label: "Favoritos",
          iconData: Icons.star,
          onTap: () {
            pageStore.setPage(3);
          },
          highlighted: pageStore.page == 3,
        ),
        PageTile(
          label: "Minha Conta",
          iconData: Icons.person_pin,
          onTap: () {
            pageStore.setPage(4);
          },
          highlighted: pageStore.page == 4,
        ),
      ],
    );
  }
}
