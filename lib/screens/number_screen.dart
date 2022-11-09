import 'package:converty/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:b/b.dart';

const List<String> list = <String>['Binary', 'Octal', 'Decimal', 'Hexadecimal'];

class NumberScreen extends StatefulWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  String ddv1 = list[0];
  String ddv2 = list[1];
  late String tmp;
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  String text1 = '';
  String text2 = '';

  BaseConversion binaryAndOctal = BaseConversion(from: binary, to: octal);
  BaseConversion binaryAndDecimal = BaseConversion(from: binary, to: decimal);
  BaseConversion binaryAndHexadecimal =
      BaseConversion(from: binary, to: hexadecimal);
  BaseConversion octalAndDecimal = BaseConversion(from: octal, to: decimal);
  BaseConversion octalAndHexadecimal =
      BaseConversion(from: octal, to: hexadecimal);
  BaseConversion decimalAndHexadecimal =
      BaseConversion(from: decimal, to: hexadecimal);

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
        title: Text('Number System', style: converseStyle),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildDropdownButton(0),
                TextField(
                  keyboardType: ddv1 != 'Hexadecimal'
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
                  keyboardType: ddv2 != 'Hexadecimal'
                      ? TextInputType.number
                      : TextInputType.text,
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
        if (index == 0 && newValue == ddv2) {
          swap();
        } else if (index == 1 && newValue == ddv1) {
          swap();
        } else {
          if (index == 0) {
            setState(() {
              ddv1 = newValue!;
            });
          } else {
            setState(() {
              ddv2 = newValue!;
            });
          }
          tec1.text = '';
          tec2.text = '';
        }
      },
    );
  }

  void listener1() {
    setState(() {
      tec1.text != ''
          ? conversion(tec1.text, ddv1, ddv2)
          : conversion('0', ddv1, ddv2);
    });
  }

  void listener2() {
    setState(() {
      tec2.text != ''
          ? conversion(tec2.text, ddv2, ddv1)
          : conversion('0', ddv2, ddv1);
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

  void conversion(value, from, to) {
    value = value.toString().toUpperCase();
    late BaseConversion baseConversion;
    switch (from) {
      case 'Binary':
        baseConversion = binaryTo(to);
        break;
      case 'Octal':
        baseConversion = octalTo(to);
        break;
      case 'Decimal':
        baseConversion = decimalTo(to);
        break;
      case 'Hexadecimal':
        baseConversion = hexadecimalTo(to);
        break;
    }
    if (to == ddv2) {
      text1 = value;
      tec2.text = baseConversion(value);
    } else {
      text2 = value;
      tec1.text = baseConversion(value);
    }
  }

  BaseConversion binaryTo(to) {
    late BaseConversion bc;
    switch (to) {
      case 'Octal':
        bc = binaryAndOctal;
        break;
      case 'Decimal':
        bc = binaryAndDecimal;
        break;
      case 'Hexadecimal':
        bc = binaryAndHexadecimal;
        break;
    }
    return bc;
  }

  BaseConversion octalTo(to) {
    late BaseConversion bc;
    switch (to) {
      case 'Binary':
        bc = binaryAndOctal.inverse();
        break;
      case 'Decimal':
        bc = octalAndDecimal;
        break;
      case 'Hexadecimal':
        bc = octalAndHexadecimal;
        break;
    }
    return bc;
  }

  BaseConversion decimalTo(to) {
    late BaseConversion bc;
    switch (to) {
      case 'Octal':
        bc = octalAndDecimal.inverse();
        break;
      case 'Binary':
        bc = binaryAndDecimal.inverse();
        break;
      case 'Hexadecimal':
        bc = decimalAndHexadecimal;
        break;
    }
    return bc;
  }

  BaseConversion hexadecimalTo(to) {
    late BaseConversion bc;
    switch (to) {
      case 'Octal':
        bc = octalAndHexadecimal.inverse();
        break;
      case 'Decimal':
        bc = decimalAndHexadecimal.inverse();
        break;
      case 'Binary':
        bc = binaryAndHexadecimal.inverse();
        break;
    }
    return bc;
  }
}
