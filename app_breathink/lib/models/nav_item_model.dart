import 'rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({
    required this.title,
    required this.rive,
  });
}

// Rive Icons
List<NavItemModel> navItems = [
  NavItemModel(
    title: 'Home', // Nome do ícone
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv', // Caminho do arquivo .riv
      artboard: 'HOME', // Nome do artboard (Titulo do icone no Rive)
      stateMachineName: 'HOME_Interactivity', // Nome do State ('active'/'idle'...)
    ),
  ),
  NavItemModel(
    title: 'Search',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Timer',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'TIMER',
      stateMachineName: 'TIMER_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Notification',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'BELL',
      stateMachineName: 'BELL_Interactivity',
    ),
  ),
];