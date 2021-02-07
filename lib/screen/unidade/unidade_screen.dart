import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/componets/error_box.dart';
import 'package:manutencao_parse/models/unidade.dart';
import 'package:manutencao_parse/stores/unidade_store.dart';

class UnidadeScreen extends StatelessWidget {
  final Unidade selected;
  final bool showAll;
  final UnidadeStore unidadeStore = GetIt.I<UnidadeStore>();

  UnidadeScreen({this.showAll = true, this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[900],
            Colors.blue[200],
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Unidades"),
          centerTitle: true,
        ),
        body: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.fromLTRB(32, 12, 32, 32),
            elevation: 10,
            child: Observer(
              builder: (_) {
                if (unidadeStore.error != null) {
                  return ErrorBox(message: unidadeStore.error);
                } else if (unidadeStore.unidadeList.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final unidades = showAll
                      ? unidadeStore.allUnidadeList
                      : unidadeStore.unidadeList;
                  return ListView.separated(
                      itemBuilder: (_, index) {
                        final unidade = unidades[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pop(unidade);
                          },
                          child: Container(
                            height: 50,
                            color: unidade.id == selected?.id
                                ? Colors.purple.withAlpha(50)
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              unidade.unidade,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: unidade.id == selected?.id
                                      ? FontWeight.bold
                                      : null,
                                  fontSize: 16),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return Divider(
                          height: 0.1,
                          color: Colors.grey,
                        );
                      },
                      itemCount: unidades.length);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
