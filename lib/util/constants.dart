import 'package:flutter/material.dart';

TextStyle converseStyle = const TextStyle(fontFamily: 'Converse');

TextStyle titleStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle descStyle = const TextStyle(
  fontSize: 16,
);

TextStyle tagStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

SliverGridDelegateWithFixedCrossAxisCount tagsGrid =
    const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 1,
  mainAxisExtent: 90,
  mainAxisSpacing: 8,
);
