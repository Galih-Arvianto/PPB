import 'package:flutter/material.dart';
import 'package:tugas/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(255, 119, 12, 12),
        scaffoldBackgroundColor: Color.fromARGB(255, 47, 4, 4),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 114, 30, 30),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      home: InputPage(),
    );
  }
}
