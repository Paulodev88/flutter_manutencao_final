import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  FieldTitle(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3, bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text("$title    ",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
          Text(
            "$subTitle",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
