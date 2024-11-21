// Stateless para widgets imutáveis
// Stateful para widgets mutáveis
// State: guarda os dados que podem mudar (ex: aba selecionada), permite atualizar a interface
// Build: gera a interface do widget
// Scaffold: estrutura básica de uma página

import 'package:app_breathink/models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const Color botNavBarColor = Color(0xFF1E1E1E);


class BotNavBar extends StatefulWidget {
    const BotNavBar({super.key});

    // Permite que o widget seja atualizado
    @override
    State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState
    extends State<BotNavBar> {
        List<SMIBool> riveIconInputs = [];
        List<StateMachineController?> controllers = [];
        int selectedNavIndex = 0;
        List<String> pages = ["Chat", "Home", "Profile", "Notificações"]; // Páginas que o botão de navegação leva

        void animateTheIcon(int index) {
            riveIconInputs[index].change(true); // Ativa a animação
            Future.delayed(Duration(seconds: 1), () {
                riveIconInputs[index].change(false); // Desativa a animação
            });
        }

        void riveOnInit(Artboard artboard, {required String stateMachineName, required int index}) {
            StateMachineController? controller = StateMachineController.fromArtboard(artboard, stateMachineName);
            if (controller != null) {
                artboard.addController(controller);
                // Garante que o input é atribuído ao índice correto
                if (riveIconInputs.length <= index) {
                }
                riveIconInputs[index] = controller.findInput<bool>('active') as SMIBool;
                if (controllers.length <= index) {
                    controllers.addAll(List.generate(index - controllers.length + 1, (_) => null));
                }
                controllers[index] = controller;
            }
        }

        @override
        void dispose() {
            for(var controller in controllers) {
                controller?.dispose();
            };
            super.dispose();
        }

        // Gera a interface do widget
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                body: Center(
                    child: Text(pages[selectedNavIndex]),
                ),
                bottomNavigationBar: SafeArea(
                  child: Container(
                      height: 64,
                      padding: EdgeInsets.all(11),
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                          color: botNavBarColor.withOpacity(0.8),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                              ),
                          ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            navItems.length,
                            (index) {
                                final riveIcon = navItems[index].rive;
                                return GestureDetector(
                                    onTap: () {
                                        animateTheIcon(index);
                                        setState(() {
                                          selectedNavIndex = index;
                                        });
                                    },
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AnimatedBar(isActive: selectedNavIndex == index),
                                    SizedBox(
                                        height: 36,
                                        width: 36,
                                        child: Opacity(
                                            opacity: selectedNavIndex == index ? 1 : 0.5,
                                          child: RiveAnimation.asset(
                                              riveIcon.src,
                                              artboard: riveIcon.artboard,
                                              onInit: (artboard) {
                                                  riveOnInit(artboard, stateMachineName: riveIcon.stateMachineName, index: index);
                                                  },
                                          ),
                                        ),
                                    ),
                                  ],
                                ),
                                );
                            },
                      ),
                    ),
                  ),
                ),
            ); //Estrutura básica de uma página
        }
    }

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 2),
        height: 4,
        width: isActive ? 20 : 0,
        decoration: BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
    );
  }
}