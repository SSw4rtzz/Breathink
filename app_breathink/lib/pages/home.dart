import 'package:flutter/material.dart';
import '/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();


// Aparecer o livro que está a ler e recomendações futuras
// Estatisticas de leitura maybe
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Search(), // Search bar
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                Container(
                  height: 150,
                  color: Colors.red,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const Text('Teste');
                      } else if (index == 1) {
                        return const Text('Teste 2');
                      }
                    },
                  ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
