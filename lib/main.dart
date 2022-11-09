import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const Converty());
}

class Converty extends StatelessWidget {
  const Converty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converty',
      themeMode: ThemeMode.system,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.indigo.shade900,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black45,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 40),
        canvasColor: Colors.indigo,
      ),
      home: const HomePage(title: 'Converty'),
    );
  }
}
