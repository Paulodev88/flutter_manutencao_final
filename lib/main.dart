import 'package:flutter/material.dart';
import 'package:manutencao_parse/screen/base/base_Screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();

  runApp(MyApp());
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
        scaffoldBackgroundColor: Colors.blue[700],
        appBarTheme: AppBarTheme(elevation: 0, color: Colors.blue[700]),
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
