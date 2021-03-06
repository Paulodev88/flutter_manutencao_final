import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:manutencao_parse/helpers/search_name.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/screen/create/create_screen.dart';
import 'package:manutencao_parse/screen/manutencao/manutecao_scree.dart';
import 'package:manutencao_parse/stores/myMaintenance_store.dart';
import 'package:manutencao_parse/helpers/extensions.dart';

class ActiveTile extends StatelessWidget {
  ActiveTile(this.manutencao, this.maintenance);
  final Manutencao manutencao;
  final MyMaintenanceStore maintenance;

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Excluir', iconData: Icons.delete)
  ];
  @override
  Widget build(BuildContext context) {
    SearchName name = SearchName();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => ManutencaoScreen(manutencao)));
      },
      child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Container(
            height: 80,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: manutencao.image.isEmpty
                        ? "https://static.thenounproject.com/png/194055-200.png"
                        : manutencao.image.first,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          manutencao.nome,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(name.unidadeName(manutencao.unidade.id)),
                        Text(
                          manutencao.created.formattedDate(),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PopupMenuButton<MenuChoice>(
                  onSelected: (choice) {
                    switch (choice.index) {
                      case 0:
                        editManutencao(context);
                        break;

                      case 1:
                        deleteManutencao(context);
                        break;
                    }
                  },
                  icon: Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Colors.blue,
                  ),
                  itemBuilder: (_) {
                    return choices
                        .map((choice) => PopupMenuItem<MenuChoice>(
                            value: choice,
                            child: Row(
                              children: [
                                Icon(
                                  choice.iconData,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  choice.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue),
                                )
                              ],
                            )))
                        .toList();
                  },
                )
              ],
            ),
          )),
    );
  }

  Future<void> editManutencao(BuildContext context) async {
    final success = await Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => CreateScreen(manutencao: manutencao)));

    if (success != null && success) maintenance.refresh();
  }

  void deleteManutencao(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Excluir'),
        content: Text('Confirmar a exclusão de ${manutencao.nome}?'),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: Navigator.of(context).pop,
            child: Text('Não'),
            textColor: Colors.blue,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              maintenance.deleteManutencao(manutencao);
            },
            child: Text('Sim'),
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class MenuChoice {
  MenuChoice({this.index, this.title, this.iconData});

  final int index;
  final String title;
  final IconData iconData;
}
