// Stateless para widgets imutáveis
// Stateful para widgets mutáveis
// State: guarda os dados que podem mudar (ex: aba selecionada), permite atualizar a interface
// Build: gera a interface do widget
// Scaffold: estrutura básica de uma página

import 'package:flutter/material.dart';

const Color buttonNavBarColor = Color(0xFF1E1E1E);


class BotNavBar extends StatefulWidget {
    const BotNavBar({super.key});

    // Permite que o widget seja atualizado
    @override
    State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState
    extends State<BotNavBar> {
        // Gera a interface do widget
        @override
        Widget build(BuildContext context) {
            return Scaffold(); //Estrutura básica de uma página
        }
    }