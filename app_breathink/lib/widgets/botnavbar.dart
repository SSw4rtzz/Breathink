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

        void animateTheIcon(int index) {
            riveIconInputs[index].change(true); // Ativa a animação
            Future.delayed(Duration(seconds: 1), () {
                riveIconInputs[index].change(false); // Desativa a animação
            });
        }

        void riveOnInit(Artboard artboard, {required String stateMachineName}) {
            StateMachineController? controller = StateMachineController.fromArtboard(artboard, stateMachineName);
            artboard.addController(controller!);
            riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
        }
        // Gera a interface do widget
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                bottomNavigationBar: SafeArea(
                  child: Container(
                      height: 56,
                      padding: EdgeInsets.all(12),
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
                                    },
                                child: SizedBox(
                                    height: 36,
                                    width: 36,
                                    child: RiveAnimation.asset(
                                        riveIcon.src,
                                        artboard: riveIcon.artboard,
                                        onInit: (artboard) {
                                            riveOnInit(artboard, stateMachineName: riveIcon.stateMachineName);
                                            },
                                    ),
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