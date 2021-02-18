import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:manutencao_parse/helpers/search_name.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/screen/manutencao/manutecao_scree.dart';
import 'package:manutencao_parse/stores/myMaintenance_store.dart';

class PendingTile extends StatelessWidget {
  PendingTile(this.manutencao, this.maintenance);
  final Manutencao manutencao;
  final MyMaintenanceStore maintenance;
  @override
  Widget build(BuildContext context) {
    SearchName name = SearchName();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => ManutencaoScreen(manutencao)));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: Container(
          height: 80,
          child: Row(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: CachedNetworkImage(
                  imageUrl: manutencao.image.isEmpty
                      ? "https://static.thenounproject.com/png/194055-200.png"
                      : manutencao.image[0],
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
                    children: <Widget>[
                      Text(
                        manutencao.nome,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(name.unidadeName(manutencao.unidade.id)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.purple,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'AGUARDANDO PUBLICAÇÃO',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
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
