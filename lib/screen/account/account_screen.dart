import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/componets/drawer/custom_Drawer.dart';
import 'package:manutencao_parse/screen/edit_account/edit_account_screen.dart';
import 'package:manutencao_parse/screen/mymaintenance/myMaintenance_screen.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';

class AccountScreen extends StatelessWidget {
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
          title: Text("Minha Conta"),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 140,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Observer(builder: (_) {
                              return Text(
                                GetIt.I<UserMenagerStore>().user.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            }),
                            Text(
                              GetIt.I<UserMenagerStore>().user.email,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue[900],
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          child: Text("EDITAR"),
                          textColor: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => EditAccountScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Meus anúncios",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => MyMaintenaceScreen()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Favoritos",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
