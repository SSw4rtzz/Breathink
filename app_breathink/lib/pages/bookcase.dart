import 'package:flutter/material.dart';

class BookcaseScreen extends StatelessWidget {
  // Lista de categorias
  final List<Map<String, dynamic>> categories = [
    {'title': 'Lido', 'icon': Icons.check_circle, 'color': Colors.orange},
    {'title': 'Por Ler', 'icon': Icons.circle_outlined, 'color': Colors.grey},
    {'title': 'A Ler', 'icon': Icons.menu_book, 'color': Colors.blueAccent},
    {'title': 'Transferidos', 'icon': Icons.swap_horiz, 'color': Colors.purpleAccent},
  ];

  BookcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estante'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Adiciona um livro manualmente que não esteja na API
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Screen para adicionar livros')), //! ADICIONAR
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grid de cards
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Cards por linha
                  crossAxisSpacing: 5, // Espaçamento entre cards
                  mainAxisSpacing: 5, // Espaçamento entre linhas
                  childAspectRatio: 1.8, // Proporção dos cards
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookListScreen(
                            title: category['title'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background do card
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category['icon'], color: category['color'], size: 40),
                          const SizedBox(height: 8),
                          Text(
                            category['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            '20', //! FAZER CONTADOR DINÂMICO
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Estatísticas de leitura',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Container(
              height: 100,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Gráfico de Estatísticas',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen que lista os livros filtrados por categoria (Pós Clique)
class BookListScreen extends StatelessWidget {
  final String title;

  const BookListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Lista de livros: $title',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
