import 'package:flutter/material.dart';
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

    tabController = TabController(length: 3, vsync: this);
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
                Tab(child: Text("PENDENTE")),
                Tab(child: Text("CONCLUIDA")),
                Tab(child: Text("DELETADA")),
              ]),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Container(color: Colors.white),
            Container(color: Colors.blue),
            Container(color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}
