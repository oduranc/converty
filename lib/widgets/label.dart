import 'package:converty/util/constants.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(child: Text(text, style: tagStyle)),
      ),
    );
  }
}
