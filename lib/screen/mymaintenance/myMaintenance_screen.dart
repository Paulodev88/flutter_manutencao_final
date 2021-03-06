import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:manutencao_parse/componets/empty_card.dart';
import 'package:manutencao_parse/screen/mymaintenance/componenets/active_tile.dart';
import 'package:manutencao_parse/stores/myMaintenance_store.dart';

class MyMaintenaceScreen extends StatefulWidget {
  MyMaintenaceScreen({this.initialPage = 0});
  final int initialPage;
  @override
  _MyMaintenaceScreenState createState() => _MyMaintenaceScreenState();
}

class _MyMaintenaceScreenState extends State<MyMaintenaceScreen>
    with SingleTickerProviderStateMixin {
  final MyMaintenanceStore maintenance = MyMaintenanceStore();
  TabController tabController;

  @override
  void initState() {
    super.initState();
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
            title: Text("Minhas Manutenções"),
            centerTitle: true,
          ),
          body: Observer(builder: (_) {
            if (maintenance.loading)
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            return Observer(builder: (_) {
              if (maintenance.activeMaintenance.isEmpty)
                return EmptyCard(
                    "Você não possui nenhuma manutenção, vamos trabalhar!");

              return ListView.builder(
                itemCount: maintenance.activeMaintenance.length,
                itemBuilder: (_, index) {
                  return ActiveTile(
                      maintenance.activeMaintenance[index], maintenance);
                },
              );
            });
          }),
        ),
      ),
    );
  }
}
