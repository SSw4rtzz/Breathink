import 'package:flutter/material.dart';
import '/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Search(), // Usa o widget aqui
        ],
      ),
    );
  }
}