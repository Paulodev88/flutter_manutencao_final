import 'package:flutter/material.dart';
import 'package:manutencao_parse/screen/home/home_Screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  //Controlador de Paginas
  final PageController pageController = PageController();

  //marcador de paginas universal

  @override
  Widget build(BuildContext context) {
    //Tela Principal
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
