import 'package:flutter/material.dart';

class CatTitle extends StatelessWidget {
  final String title;
  const CatTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
        child: Text(title,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }
}
