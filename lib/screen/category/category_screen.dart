import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/componets/error_box.dart';
import 'package:manutencao_parse/models/category.dart';
import 'package:manutencao_parse/stores/category_store.dart';

class CategoryScreen extends StatelessWidget {
  final Category selected;
  final bool showAll;
  final CategoryStore categoryStore = GetIt.I<CategoryStore>();

  CategoryScreen({this.showAll = true, this.selected});

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
            title: const Text("Categorias"),
            centerTitle: true,
          ),
          body: Center(
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 10,
                margin: const EdgeInsets.fromLTRB(32, 12, 32, 150),
                child: Observer(builder: (_) {
                  if (categoryStore.error != null) {
                    return ErrorBox(message: categoryStore.error);
                  } else if (categoryStore.categoryList.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final categories = showAll
                        ? categoryStore.allcategoryList
                        : categoryStore.categoryList;
                    return ListView.separated(
                        itemBuilder: (_, index) {
                          final category = categories[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pop(category);
                            },
                            child: Container(
                              height: 50,
                              color: category.id == selected?.id
                                  ? Colors.purple.withAlpha(50)
                                  : null,
                              alignment: Alignment.center,
                              child: Text(
                                category.description,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: category.id == selected?.id
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
                        itemCount: categories.length);
                  }
                })),
          ),
        ),
      ),
    );
  }
}
