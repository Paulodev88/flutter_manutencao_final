import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  EmptyCard(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(32),
      child: Column(
        children: [
          Expanded(
            child: Icon(
              Icons.border_clear,
              size: 200,
              color: Colors.grey,
            ),
            flex: 4,
          ),
          Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hummm...",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
