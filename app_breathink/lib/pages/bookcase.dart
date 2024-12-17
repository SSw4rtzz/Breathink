import 'package:flutter/material.dart';

class BookcaseScreen extends StatelessWidget {
  // Lista de categorias
  final List<Map<String, dynamic>> categories = [
    {'title': 'Lido', 'icon': Icons.check_circle, 'color': Colors.orange},
    {'title': 'Por Ler', 'icon': Icons.circle_outlined, 'color': Colors.grey},
    {'title': 'A Ler', 'icon': Icons.menu_book, 'color': Colors.blueAccent},
    {'title': 'Emprestado', 'icon': Icons.swap_horiz, 'color': Colors.purpleAccent},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estante'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Adiciona um livro manualmente que não esteja na API
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Screen para adicionar livros')), //! ADICIONAR
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
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
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category['icon'], color: category['color'], size: 40),
                          SizedBox(height: 8),
                          Text(
                            category['title'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '0 livros', //! FAZER CONTADOR DINÂMICO
                            style: TextStyle(
                              fontSize: 14,
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
            SizedBox(height: 20),
            Text('Estatísticas de leitura',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Container(
              height: 100,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
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

  const BookListScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Center(
        child: Text(
          'Lista de livros: $title',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
