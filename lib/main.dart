import 'package:flutter/material.dart';
import 'package:lab2/screens/home.dart';
import 'package:lab2/screens/jokesoftype.dart';
import 'package:lab2/screens/randomjoke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jokes',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: "/",
        routes: {
          "/": (context) => const Home(),
          "/jokesoftype": (context) => const JokesOfType(),
          "/randomjoke": (context) => const Randomjoke(),
        });
  }
}
