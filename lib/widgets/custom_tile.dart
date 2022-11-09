import 'package:converty/screens/ascii_screen.dart';
import 'package:converty/screens/number_screen.dart';
import 'package:converty/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:converty/widgets/label.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {Key? key,
      required this.title,
      required this.desc,
      required this.tags,
      required this.icon})
      : super(key: key);
  final String title, desc;
  final List<String> tags;
  final IconData icon;

  Color iconBorderColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => title == 'ASCII Converter'
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AsciiScreen(),
              ),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NumberScreen(),
              ),
            ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo.withOpacity(0.5),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: SizedBox(
            height: 110,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: iconBorderColor(context),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(icon),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(flex: 2, child: Text(title, style: titleStyle)),
                      Expanded(flex: 3, child: Text(desc, style: descStyle)),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: tags.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Label(text: tags[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
