import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/filter/components/section_title.dart';
import 'package:manutencao_parse/stores/unidade_store.dart';

class OrderByField extends StatelessWidget {
  final UnidadeStore unidadeStore = GetIt.I<UnidadeStore>();

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title) {
      return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.blue[400]),
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Ordenar por:"),
        Row(
          children: [
            buildOption("Nome"),
            const SizedBox(
              width: 12,
            ),
            buildOption("Data"),
          ],
        ),
      ],
    );
  }
}
