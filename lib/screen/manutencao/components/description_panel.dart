import 'package:flutter/material.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:readmore/readmore.dart';

class DescriptionPanel extends StatelessWidget {
  DescriptionPanel(this.manutencao);
  final Manutencao manutencao;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Descrição do problema:',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ReadMoreText(
            manutencao.problema,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Ver mais...",
            trimExpandedText: "...ver menos.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Descrição da solução:',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ReadMoreText(
            manutencao.solucao,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Ver mais...",
            trimExpandedText: "...ver menos.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Observação:',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ReadMoreText(
            manutencao.observacao,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Ver mais...",
            trimExpandedText: "...ver menos.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
