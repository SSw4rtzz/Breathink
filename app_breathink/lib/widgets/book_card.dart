import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookCard extends StatelessWidget {
  final String title;
  final bool isFullWidth;
  final bool showProgressBar;
  final double progress;

  const BookCard({
    super.key,
    required this.title,
    this.isFullWidth = false,
    this.showProgressBar = false,
    this.progress = 0.0,
  });

  Future<Map<String, dynamic>?> fetchBookData(String title) async {
    // Substitui espaços no titulo por "+"
    // API: Open Library
    final query = title.replaceAll(" ", "+");
    final url = Uri.parse("https://openlibrary.org/search.json?title=$query");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['docs'] != null && data['docs'].isNotEmpty) {
          final book = data['docs'][0];
          final coverId = book['cover_i'];
          final numPages = book['number_of_pages_median'];
          final coverUrl = coverId != null
              ? "https://covers.openlibrary.org/b/id/$coverId-L.jpg"
              : null;
          return {
            'coverUrl': coverUrl,
            'numPages': numPages ?? 0,
          };
        }
      }
    } catch (e) {
      print("Erro ao buscar dados: $e"); //! Debug
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: fetchBookData(title),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            width: isFullWidth ? double.infinity : 100,
            height: isFullWidth ? 200 : 150,
            color: Colors.grey.shade300,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final bookData = snapshot.data!;
        final coverUrl = bookData['coverUrl'];
        final numPages = bookData['numPages'];

        // Cards pequenas
        return Container(
          width: isFullWidth ? double.infinity : 130,
          height: isFullWidth ? 200 : 180,
          margin: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: coverUrl != null
                ? DecorationImage(
                    image: NetworkImage(coverUrl),
                    fit: BoxFit.cover,
                  )
                : null,
            color: Colors.grey.shade300,
          ),
          child: Stack(
            children: [
              if (isFullWidth)
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$numPages páginas",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              // Barra de progresso de leitura
              if (showProgressBar)
                Align(
                  alignment: Alignment.bottomLeft, // Barra alinhada ao fundo
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    width: isFullWidth ? double.infinity : null,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color.fromARGB(255, 197, 127, 30),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
