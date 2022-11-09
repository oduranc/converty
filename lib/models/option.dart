import 'package:flutter/material.dart';

class Option {
  late String title;
  late String description;
  late IconData icon;
  late List<String> tags;

  Option({
    required this.title,
    required this.description,
    required this.icon,
    required this.tags,
  });
}
