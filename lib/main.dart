import 'package:flutter/material.dart';
import 'package:manutencao_parse/screen/base/base_Screen.dart';
import 'package:manutencao_parse/stores/category_store.dart';
import 'package:manutencao_parse/stores/unidade_store.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/stores/page_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserMenagerStore());
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.I.registerSingleton(UnidadeStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Manutenção SCI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(elevation: 0, color: Colors.transparent),
      ),
      home: BaseScreen(),
    );
  }
}

Future<void> initializeParse() async {
  await Parse().initialize('VJgY4ib1MoBOXgEKKq2YMOJtPBlvH5IR9JGYteTA',
      'https://parseapi.back4app.com/',
      clientKey: 'LnVUz2yLxu5Nyn6KlHEDfVBM5c958IN5GMRXPcFi',
      autoSendSessionId: true,
      debug: true);
}
