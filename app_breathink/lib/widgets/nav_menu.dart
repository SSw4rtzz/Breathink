import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  // Flag para alternar entre o menu arredondado flutuante e o menu padrão
  final bool isRounded = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => isRounded
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.black, // Fundo preto
                    borderRadius: BorderRadius.circular(40), // Cantos arredondados
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 5), // Sombra deslocada
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(
                        icon: Iconsax.home,
                        label: 'Home',
                        isSelected: controller.selectedIndex.value == 0,
                        onTap: () => controller.selectedIndex.value = 0,
                      ),
                      _buildNavItem(
                        icon: Iconsax.book_1,
                        label: 'Livros',
                        isSelected: controller.selectedIndex.value == 1,
                        onTap: () => controller.selectedIndex.value = 1,
                      ),
                      _buildNavItem(
                        icon: Iconsax.note_2,
                        label: 'Estante',
                        isSelected: controller.selectedIndex.value == 2,
                        onTap: () => controller.selectedIndex.value = 2,
                      ),
                      _buildNavItem(
                        icon: Iconsax.cup,
                        label: 'Objetivos',
                        isSelected: controller.selectedIndex.value == 3,
                        onTap: () => controller.selectedIndex.value = 3,
                      ),
                    ],
                  ),
                ),
              )
            : NavigationBar(
                height: 80,
                elevation: 0,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) => controller.selectedIndex.value = index,
                destinations: const [
                  NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
                  NavigationDestination(icon: Icon(Iconsax.book_1), label: 'Livros'),
                  NavigationDestination(icon: Icon(Iconsax.note_2), label: 'Estante'),
                  NavigationDestination(icon: Icon(Iconsax.cup), label: 'Objetivos'),
                ],
              ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Alinha verticalmente no centro
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.pink : Colors.white, // Cor do ícone selecionado
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.white, // Cor do texto
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
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
