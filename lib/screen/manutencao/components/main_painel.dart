import 'package:flutter/material.dart';
import 'package:manutencao_parse/helpers/search_name.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/helpers/extensions.dart';

class MainPainel extends StatelessWidget {
  MainPainel(this.manutencao);

  final Manutencao manutencao;
  @override
  Widget build(BuildContext context) {
    SearchName name = SearchName();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 14),
          child: Text(
            manutencao.nome,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800]),
            textAlign: TextAlign.start,
            maxLines: null,
          ),
        ),
        Divider(
          color: Colors.grey[500],
        ),
        Text("Unidade: ", style: TextStyle(fontSize: 20)),
        Text(
          name.unidadeName(manutencao.unidade.id),
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 18),
          child: Text(
            'Publicado em ${manutencao.created.formattedDate()}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ),
        Divider(
          color: Colors.grey[500],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Tensao: ${manutencao.tensao} V",
              style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700]),
              maxLines: null,
            ),
            SizedBox(
              width: 8,
            ),
            Text('|'),
            SizedBox(
              width: 8,
            ),
            Text(
              "Corrente: ${manutencao.corrente} A",
              style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700]),
            ),
          ],
        ),
        Divider(
          color: Colors.grey[500],
        ),
        Text(
          "Patrimônio: ${manutencao.patrimonio}",
          style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700]),
          maxLines: null,
        ),
        Divider(
          color: Colors.grey[500],
        ),
        Text(
          "Tag: ${manutencao.tag} ",
          style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700]),
          maxLines: null,
        ),
      ],
    );
  }
}
