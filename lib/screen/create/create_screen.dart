import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manutencao_parse/componets/drawer/custom_Drawer.dart';
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
          body: SingleChildScrollView(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ImagesField(createStore),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome do equipamento",
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                    ),
                  ),
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
                ],
              ),
            ),
          ),
        ));
  }
}

//maxlines: null
