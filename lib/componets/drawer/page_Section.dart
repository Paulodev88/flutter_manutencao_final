import 'package:flutter/material.dart';
import 'package:manutencao_parse/componets/drawer/page_Tile.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: "Manutenções",
          iconData: Icons.format_list_bulleted,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          label: "Inserir Manutenção",
          iconData: Icons.edit,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
            label: "Observações",
            iconData: Icons.chat_outlined,
            onTap: () {},
            highlighted: false),
        PageTile(
          label: "Favoritos",
          iconData: Icons.star,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          label: "Minha Conta",
          iconData: Icons.person_pin,
          onTap: () {},
          highlighted: false,
        ),
      ],
    );
  }
}
