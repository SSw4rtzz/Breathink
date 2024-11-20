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
    title: 'Home',
    rive: RiveModel(
      src: 'assets/rive/home.riv',
      artboard: 'home',
      stateMachineName: 'idle',
    ),
  ),
  NavItemModel(
    title: 'Search',
    rive: RiveModel(
      src: 'assets/rive/search.riv',
      artboard: 'search',
      stateMachineName: 'idle',
    ),
  ),
  NavItemModel(
    title: 'Profile',
    rive: RiveModel(
      src: 'assets/rive/profile.riv',
      artboard: 'profile',
      stateMachineName: 'idle',
    ),
  ),
  NavItemModel(
    title: 'Settings',
    rive: RiveModel(
      src: 'assets/rive/settings.riv',
      artboard: 'settings',
      stateMachineName: 'idle',
    ),
  ),
];