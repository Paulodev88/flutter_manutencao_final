import 'package:flutter/material.dart';
import 'package:manutencao_parse/models/manutencao.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget {
  BottomBar(this.manutencao);
  final Manutencao manutencao;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Colors.blue[700]),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      final phone = manutencao.user.phone
                          .replaceAll(RegExp("[^0-9]"), "");
                      launch('tel:$phone ');
                    },
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Text(
                        "Ligar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 25,
                    alignment: Alignment.center,
                    child: Text(
                      "Comentar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 249, 1),
              border: Border(
                top: BorderSide(
                  color: Colors.grey[400],
                ),
              ),
            ),
            height: 38,
            alignment: Alignment.center,
            child: Text(
              '${manutencao.user.name} (Técnico responsável)',
              style: TextStyle(fontWeight: FontWeight.w300),
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
