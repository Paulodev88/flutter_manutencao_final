import 'package:flutter/material.dart';
import 'package:manutencao_parse/componets/drawer/custom_Drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manutenções da SCI"),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
