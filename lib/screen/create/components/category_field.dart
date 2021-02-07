import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:manutencao_parse/screen/category/category_screen.dart';
import 'package:manutencao_parse/stores/create_store.dart';

class CategoryField extends StatelessWidget {
  final CreateStore createStore;

  CategoryField(this.createStore);
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: createStore.category == null
              ? Text(
                  "Categoria",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
              : Text(
                  "Categoria",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
          subtitle: createStore.category == null
              ? null
              : Text(
                  "${createStore.category.description}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () async {
            final category = await showDialog(
              context: context,
              builder: (_) => CategoryScreen(
                showAll: false,
                selected: createStore.category,
              ),
            );
            if (category != null) {
              createStore.setCatgory(category);
            }
          },
        );
      },
    );
  }
}
