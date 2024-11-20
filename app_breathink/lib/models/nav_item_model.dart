import 'rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({
    required this.title,
    required this.rive,
  });
}

List<NavItemModel> navItems = [
  NavItemModel(
    title: 'chat',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'CHAT',
      stateMachineName: 'CHAT_Interactivity',
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