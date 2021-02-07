import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:manutencao_parse/componets/drawer/custom_Drawer.dart';
import 'package:manutencao_parse/screen/create/components/category_field.dart';
import 'package:manutencao_parse/screen/create/components/unidade_field.dart';
import 'package:manutencao_parse/stores/create_store.dart';
import 'components/images_field.dart';

class CreateScreen extends StatelessWidget {
  final CreateStore createStore = CreateStore();

  final labelStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.grey,
    fontSize: 15,
  );

  final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

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
            title: Text(
              "Criar Manutenção",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ImagesField(createStore),
                    Observer(builder: (_) {
                      return TextFormField(
                        onChanged: createStore.setTitle,
                        decoration: InputDecoration(
                            labelText: "Nome do equipamento",
                            labelStyle: labelStyle,
                            contentPadding: contentPadding,
                            errorText: createStore.nameError),
                      );
                    }),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Tensão",
                                labelStyle: labelStyle,
                                contentPadding: contentPadding,
                                suffixText: "V"),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Corrente",
                                labelStyle: labelStyle,
                                contentPadding: contentPadding,
                                suffixText: "A"),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {},
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Patrimônio",
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "TAG",
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                      ),
                    ),
                    CategoryField(createStore),
                    UnidadeField(createStore),
                    Observer(builder: (_) {
                      return TextFormField(
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
                    Observer(
                      builder: (_) {
                        return SizedBox(
                          height: 50,
                          child: GestureDetector(
                            onTap: createStore.invalidSendPressed,
                            child: RaisedButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onPressed: createStore.sendPressed,
                              child: Text(
                                "Salvar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              color: Colors.purple,
                              disabledColor: Colors.purple[100],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
