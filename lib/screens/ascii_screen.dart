import 'package:converty/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> list = <String>['ASCII', 'Characters'];

class AsciiScreen extends StatefulWidget {
  const AsciiScreen({Key? key}) : super(key: key);

  @override
  State<AsciiScreen> createState() => _AsciiScreenState();
}

class _AsciiScreenState extends State<AsciiScreen> {
  String ddv1 = list.first;
  String ddv2 = list.last;
  late String tmp;
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  String text1 = '';
  String text2 = '';

  @override
  void dispose() {
    tec1.dispose();
    tec2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASCII Converter', style: converseStyle),
      ),
      body: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildDropdownButton(0),
                TextField(
                  maxLines: 5,
                  minLines: 1,
                  keyboardType: ddv1 == list.first
                      ? TextInputType.number
                      : TextInputType.text,
                  style: descStyle,
                  controller: tec1,
                  autocorrect: false,
                  onTap: () {
                    tec1.addListener(listener1);
                    tec2.removeListener(listener2);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(60),
                  child: IconButton(
                      onPressed: swap,
                      icon: const Icon(Icons.swap_vert_circle_rounded)),
                ),
                buildDropdownButton(1),
                TextField(
                  maxLines: 5,
                  minLines: 1,
                  keyboardType: ddv2 == list.last
                      ? TextInputType.text
                      : TextInputType.number,
                  style: descStyle,
                  controller: tec2,
                  autocorrect: false,
                  onTap: () {
                    tec2.addListener(listener2);
                    tec1.removeListener(listener1);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void listener1() {
    setState(() {
      ddv1 == list.first ? asciiToChar(tec1.text) : charToAscii(tec1.text);
    });
  }

  void listener2() {
    setState(() {
      ddv1 == list.first ? charToAscii(tec2.text) : asciiToChar(tec2.text);
    });
  }

  void swap() {
    setState(() {
      tmp = ddv2;
      ddv2 = ddv1;
      ddv1 = tmp;

      tmp = tec2.text;
      tec2.text = tec1.text;
      tec1.text = tmp;
    });
    FocusScope.of(context).unfocus();
    tec1.removeListener(listener1);
    tec2.removeListener(listener2);
  }

  void charToAscii(String value) {
    if (ddv1 == list.first) {
      text2 = value;
      tec1.text = text2.codeUnits.join(' ');
    } else {
      text1 = value;
      tec2.text = text1.codeUnits.join(' ');
    }
  }

  void asciiToChar(String value) {
    if (ddv1 == list.first) {
      text1 = value;
      tec2.text =
          String.fromCharCodes(text1.split(' ').map(int.parse).toList());
    } else {
      text2 = value;
      tec1.text =
          String.fromCharCodes(text2.split(' ').map(int.parse).toList());
    }
  }

  DropdownButton<String> buildDropdownButton(int index) {
    return DropdownButton(
      style: titleStyle,
      value: index == 0 ? ddv1 : ddv2,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        if (index == 0 && newValue != ddv1) {
          swap();
        } else if (index == 1 && newValue != ddv2) {
          swap();
        }
      },
    );
  }
}
