import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:manutencao_parse/screen/unidade/unidade_screen.dart';

import 'package:manutencao_parse/stores/create_store.dart';

class UnidadeField extends StatelessWidget {
  final CreateStore createStore;
  const UnidadeField(
    this.createStore,
  );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            ListTile(
              title: createStore.unidade == null
                  ? Text(
                      "Unidade",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    )
                  : Text(
                      "Unidade",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
              subtitle: createStore.unidade == null
                  ? null
                  : Text(
                      "${createStore.unidade.unidade}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                final unidade = await showDialog(
                  context: context,
                  builder: (_) => UnidadeScreen(
                    showAll: false,
                    selected: createStore.unidade,
                  ),
                );
                if (unidade != null) {
                  createStore.setUnidade(unidade);
                }
              },
            ),
            if (createStore.unidadeError != null)
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.red),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Text(
                  createStore.unidadeError,
                  style: TextStyle(color: Colors.red[800], fontSize: 13),
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[500]),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
