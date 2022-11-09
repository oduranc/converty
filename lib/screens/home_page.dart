import 'package:converty/controllers/option_brain.dart';
import 'package:converty/models/option.dart';
import 'package:converty/util/constants.dart';
import 'package:converty/widgets/custom_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Option> options = OptionBrain().getOptions();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: converseStyle,
        ),
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: CustomTile(
              title: options[index].title,
              desc: options[index].description,
              tags: options[index].tags,
              icon: options[index].icon),
        ),
      ),
    );
  }
}
