import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const GuessGame());
}

class GuessGame extends StatelessWidget {
  const GuessGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guess & Learn',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const Home(),
    );
  }
}
