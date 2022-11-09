import 'package:converty/models/option.dart';
import 'package:flutter/material.dart';

class OptionBrain {
  final List<Option> _options = [
    Option(
      title: 'ASCII Converter',
      description: 'Convert english characters to ASCII and vice-versa!',
      icon: Icons.abc_rounded,
      tags: ['ASCII', 'Characters'],
    ),
    Option(
      title: 'Number System Converter',
      description: 'Convert numbers from one system to another!',
      icon: Icons.numbers_rounded,
      tags: ['Binary', 'Octal', 'Hexadecimal'],
    ),
    // Option(
    //   title: 'Time Converter',
    //   description: 'Convert seconds to minutes, hours, weeks, years, and more!',
    //   icon: Icons.add_alarm_rounded,
    //   tags: ['Seconds', 'Minutes', 'Hours'],
    // ),
  ];

  List<Option> getOptions() {
    return _options;
  }
}
