import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:manutencao_parse/screen/mymaintenance/componenets/active_tile.dart';
import 'package:manutencao_parse/screen/mymaintenance/componenets/pending_tile.dart';
import 'package:manutencao_parse/stores/myMaintenance_store.dart';

class MyMaintenaceScreen extends StatefulWidget {
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

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          bottom: TabBar(
              controller: tabController,
              indicatorColor: Colors.white,
              tabs: [
                Tab(child: Text("CONCLUÍDA")),
                Tab(child: Text("PENDENTE")),
              ]),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Observer(builder: (_) {
              if (maintenance.activeMaintenance.isEmpty) return Container();

              return ListView.builder(
                itemCount: maintenance.activeMaintenance.length,
                itemBuilder: (_, index) {
                  return ActiveTile(
                      maintenance.activeMaintenance[index], maintenance);
                },
              );
            }),
            Observer(builder: (_) {
              if (maintenance.pendenteMaintenance.isEmpty) return Container();

              return ListView.builder(
                itemCount: maintenance.pendenteMaintenance.length,
                itemBuilder: (_, index) {
                  return PendingTile(
                      maintenance.pendenteMaintenance[index], maintenance);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
