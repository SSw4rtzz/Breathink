import 'package:flutter/material.dart';
import 'widgets/nav_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavMenu(),
      //Código original
      //home: const MyHomePage(title: 'Breathink  '),
    );
  }
}
