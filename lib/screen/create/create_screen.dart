import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/componets/drawer/custom_Drawer.dart';
import 'package:manutencao_parse/componets/error_box.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:manutencao_parse/screen/create/components/category_field.dart';
import 'package:manutencao_parse/screen/create/components/unidade_field.dart';
import 'package:manutencao_parse/screen/mymaintenance/myMaintenance_screen.dart';
import 'package:manutencao_parse/stores/create_store.dart';
import 'package:manutencao_parse/stores/page_store.dart';

import 'package:mobx/mobx.dart';
import 'components/images_field.dart';

class CreateScreen extends StatefulWidget {
  CreateScreen({this.manutencao});
  final Manutencao manutencao;
  @override
  _CreateScreenState createState() => _CreateScreenState(manutencao);
}

class _CreateScreenState extends State<CreateScreen> {
  _CreateScreenState(Manutencao manutencao)
      : editing = manutencao != null,
        createStore = CreateStore(manutencao ?? Manutencao());
  final CreateStore createStore;

  bool editing;

  @override
  void initState() {
    super.initState();

    when((_) => createStore.savedManutencao, () {
      if (editing)
        Navigator.of(context).pop(true);
      else {
        GetIt.I<PageStore>().setPage(0);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => MyMaintenaceScreen(initialPage: 1)));
      }
    });
  }

  final labelStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.grey,
    fontSize: 15,
  );

  final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
              title: Text(
                editing ? "Editar Manutenção" : "Criar Manutenção",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            drawer: editing ? null : CustomDrawer(),
            body: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 8,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Observer(builder: (_) {
                      if (createStore.loading)
                        return Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  "Salvando manutencao",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.blue),
                                )
                              ],
                            ));
                      else
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ImagesField(createStore),
                            Observer(builder: (_) {
                              return TextFormField(
                                initialValue: createStore.nome,
                                onChanged: createStore.setTitle,
                                decoration: InputDecoration(
                                    labelText: "Nome do equipamento",
                                    labelStyle: labelStyle,
                                    contentPadding: contentPadding,
                                    errorText: createStore.nameError),
                              );
                            }),
                            Observer(builder: (_) {
                              return Row(
                                children: <Widget>[
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: createStore.tensao,
                                      onChanged: createStore.setTensao,
                                      decoration: InputDecoration(
                                          labelText: "Tensão",
                                          labelStyle: labelStyle,
                                          contentPadding: contentPadding,
                                          suffixText: "V",
                                          errorText: createStore.tensaoError),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: createStore.corrente,
                                      onChanged: createStore.setCorrente,
                                      decoration: InputDecoration(
                                          labelText: "Corrente",
                                          labelStyle: labelStyle,
                                          contentPadding: contentPadding,
                                          suffixText: "A",
                                          errorText: createStore.correnteError),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              );
                            }),
                            Observer(
                              builder: (_) {
                                return TextFormField(
                                  initialValue: createStore.patrimonio,
                                  onChanged: createStore.setPatrimonio,
                                  decoration: InputDecoration(
                                      labelText: "Patrimônio",
                                      labelStyle: labelStyle,
                                      contentPadding: contentPadding,
                                      errorText: createStore.patrimonioError),
                                );
                              },
                            ),
                            Observer(
                              builder: (_) {
                                return TextFormField(
                                  initialValue: createStore.patrimonio,
                                  onChanged: createStore.setPatrimonio,
                                  decoration: InputDecoration(
                                      labelText: "Data de Aquisição",
                                      labelStyle: labelStyle,
                                      contentPadding: contentPadding,
                                      errorText: createStore.tagError),
                                );
                              },
                            ),
                            CategoryField(createStore),
                            UnidadeField(createStore),
                            Observer(builder: (_) {
                              return TextFormField(
                                initialValue: createStore.problema,
                                onChanged: createStore.setProblema,
                                maxLines: null,
                                decoration: InputDecoration(
                                    labelText: "Problema",
                                    labelStyle: labelStyle,
                                    contentPadding: contentPadding,
                                    errorText: createStore.probelmaError),
                              );
                            }),
                            Observer(
                              builder: (_) {
                                return TextFormField(
                                  initialValue: createStore.solucao,
                                  onChanged: createStore.setSolucao,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      labelText: "Solução",
                                      labelStyle: labelStyle,
                                      contentPadding: contentPadding,
                                      errorText: createStore.solucaoError),
                                );
                              },
                            ),
                            Observer(builder: (_) {
                              return TextFormField(
                                initialValue: createStore.observacao,
                                onChanged: createStore.setObservacao,
                                maxLines: null,
                                decoration: InputDecoration(
                                    labelText: "Observação",
                                    labelStyle: labelStyle,
                                    contentPadding: contentPadding,
                                    errorText: createStore.observacaoError),
                              );
                            }),
                            Observer(builder: (_) {
                              return ErrorBox(
                                message: createStore.error,
                              );
                            }),
                            Observer(
                              builder: (_) {
                                return SizedBox(
                                  height: 50,
                                  child: GestureDetector(
                                    onTap: createStore.invalidSendPressed,
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      onPressed: createStore.sendPressed,
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      color: Colors.blue,
                                      disabledColor: Colors.blue[200],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        );
                    })),
              ),
            ),
          )),
    );
  }
}
