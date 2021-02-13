import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/componets/drawer/custom_Drawer.dart';
import 'package:manutencao_parse/screen/home/componets/search_dialog.dart';
import 'package:manutencao_parse/screen/home/componets/top_bar.dart';
import 'package:manutencao_parse/stores/search_store.dart';

class HomeScreen extends StatelessWidget {
  final SearchStore searchStore = GetIt.I<SearchStore>();
  openSearch(BuildContext context) async {
    final search = await showDialog(
        context: context,
        builder: (_) {
          return SearchDialog(
            currentSearch: searchStore.search,
          );
        });
    if (search != null) searchStore.seatSearch(search);

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
            title: Observer(
              builder: (_) {
                if (searchStore.search.isEmpty)
                  return Text("Manutenções da SCI");
                return GestureDetector(
                    onTap: () => openSearch(context),
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        return Container(
                            width: constraints.biggest.width,
                            child: Text(searchStore.search));
                      },
                    ));
              },
            ),
            centerTitle: true,
            actions: [
              Observer(
                builder: (_) {
                  if (searchStore.search.isEmpty)
                    return IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          return openSearch(context);
                        });
                  return IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        return searchStore.seatSearch("");
                      });
                },
              )
            ],
          ),
          drawer: CustomDrawer(),
          body: Column(
            children: [
              TopBar(),
            ],
          ),
        ),
      ),
    );
  }
}
