import 'package:flutter/material.dart';
import '/widgets/book_card.dart';
import '/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0), // Margens laterais
        child: SingleChildScrollView(
          child: Column(
            children: [
              Search(),
              // Card de leitura atual
              BookCard(
                title: 'Never Lie', // Título do livro
                isFullWidth: true,
                showProgressBar: true,
                progress: 0.4, // 40% Lido
              ),
              SizedBox(height: 14),
              // Grelha de cards recomendadas
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Trends",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 3,
                  runSpacing: 3,
                  children: [
                    BookCard(title: '1984'),
                    BookCard(title: 'O Alquimista'),
                    BookCard(title: 'The girl on the train'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
