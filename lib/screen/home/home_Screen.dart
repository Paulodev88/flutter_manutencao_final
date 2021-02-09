import 'package:flutter/material.dart';
import 'package:manutencao_parse/componets/drawer/custom_Drawer.dart';
import 'package:manutencao_parse/screen/home/componets/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  openSearch(BuildContext context) async {
    final search = await showDialog(
        context: context,
        builder: (_) {
          return SearchDialog(
            currentSearch: "Teste",
          );
        });
    print(search);
  }

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
            title: Text("Manutenções da SCI"),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    return openSearch(context);
                  }),
            ],
          ),
          drawer: CustomDrawer(),
        ),
      ),
    );
  }
}
