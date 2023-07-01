import 'package:flutter/material.dart';
import 'package:khabar/screens/newsscreen.dart';
import 'package:khabar/utils/colorsfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 25, 25, 25)),
          useMaterial3: true,
        ),
        home: NewsScreen());
  }
}
