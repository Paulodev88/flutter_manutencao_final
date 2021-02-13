import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/filter/filter_screen.dart';
import 'package:manutencao_parse/screen/category/category_screen.dart';
import 'package:manutencao_parse/screen/home/componets/bar_button.dart';
import 'package:manutencao_parse/stores/search_store.dart';

class TopBar extends StatelessWidget {
  final SearchStore searchStore = GetIt.I<SearchStore>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(builder: (_) {
          return BarButton(
            label: searchStore.category?.description ?? "Categorias",
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[400],
                ),
              ),
            ),
            onTap: () async {
              final category = await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => CategoryScreen(
                          showAll: true,
                          selected: searchStore.category,
                        )),
              );
              if (category != null) searchStore.setCategory(category);
            },
          );
        }),
        Observer(
          builder: (_) {
            return BarButton(
              label: "Filtros",
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[400],
                  ),
                  left: BorderSide(color: Colors.grey[400]),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => FilterScreen()));
              },
            );
          },
        ),
      ],
    );
  }
}
