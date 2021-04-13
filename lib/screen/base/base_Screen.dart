import 'package:flutter/material.dart';
import 'package:manutencao_parse/screen/account/account_screen.dart';

import 'package:manutencao_parse/screen/create/create_screen.dart';
import 'package:manutencao_parse/screen/favorites/favorites_screen.dart';
import 'package:manutencao_parse/screen/home/home_Screen.dart';
import 'package:manutencao_parse/screen/offline/offline_screen.dart';
import 'package:manutencao_parse/stores/connectivity_store.dart';
import 'package:manutencao_parse/stores/page_store.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  //Controlador de Paginas
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I<PageStore>();
  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  @override
  void initState() {
    super.initState();

    reaction((_) => pageStore.page, (page) => pageController.jumpToPage(page));
    autorun((_) {
      if (!connectivityStore.connected) {
        showDialog(context: context, builder: (_) => OfflineScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Tela Principal
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomeScreen(),
            CreateScreen(),
            FavoritesScreen(),
            AccountScreen(),
          ],
        ),
      ),
    );
  }
}
