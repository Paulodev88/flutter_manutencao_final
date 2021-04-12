import 'package:flutter/material.dart';
import 'package:manutencao_parse/componets/drawer/page_Tile.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/screen/login/login_Screen.dart';
import 'package:manutencao_parse/stores/page_store.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();
  final UserMenagerStore userMenagerStore = GetIt.I<UserMenagerStore>();

  @override
  Widget build(BuildContext context) {
    Future<void> verifyLoginAndSetPage(int page) async {
      if (userMenagerStore.isLoggedIn) {
        pageStore.setPage(page);
      } else {
        final result = await Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginScreen()));
        if (result != null && result) pageStore.setPage(page);
      }
    }

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
            verifyLoginAndSetPage(1);
          },
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: "Favoritos",
          iconData: Icons.star,
          onTap: () {
            verifyLoginAndSetPage(2);
          },
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: "Minha Conta",
          iconData: Icons.person_pin,
          onTap: () {
            verifyLoginAndSetPage(3);
          },
          highlighted: pageStore.page == 3,
        ),
      ],
    );
  }
}
