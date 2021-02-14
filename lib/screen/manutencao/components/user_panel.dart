import 'package:flutter/material.dart';
import 'package:manutencao_parse/models/manutencao.dart';

class UserPanel extends StatelessWidget {
  UserPanel(this.manutencao);
  final Manutencao manutencao;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Técnico: ',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                manutencao.user.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Email ${manutencao.user.email}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
