import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/screen/login/login_Screen.dart';
import 'package:manutencao_parse/stores/page_store.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserMenagerStore userMenagerStore = GetIt.I<UserMenagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();

        if (userMenagerStore.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        color: Colors.transparent,
        child: Row(
          children: [
            Icon(
              Icons.account_circle,
              color: Colors.purple[900],
              size: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userMenagerStore.isLoggedIn
                      ? userMenagerStore.user.name
                      : "Acesse sua conta!",
                  style: TextStyle(
                      color: Colors.purple[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  userMenagerStore.isLoggedIn
                      ? userMenagerStore.user.email
                      : "Clique aqui.",
                  style: TextStyle(
                      color: Colors.purple[900],
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
