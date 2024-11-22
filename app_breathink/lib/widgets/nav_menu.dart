import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0), // Espaçamento geral ao redor
          child: Container(
            margin: const EdgeInsets.only(bottom: 16), // Espaço abaixo (flutua acima do fundo)
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black, // Cor do fundo do menu
              borderRadius: BorderRadius.circular(40), // Cantos arredondados
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Sombra
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 5), // Sombra deslocada para baixo
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: NavigationBar(
                height: 80,
                elevation: 0,
                backgroundColor: Colors.transparent, // Remove a cor padrão
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow, // Garante que o texto aparece
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Iconsax.home), 
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.book_1), 
                    label: 'Livros',
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.note_2), 
                    label: 'Estante',
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.cup), 
                    label: 'Objetivos',
                  ),
                ],
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) =>
                    controller.selectedIndex.value = index,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
  ];
}
