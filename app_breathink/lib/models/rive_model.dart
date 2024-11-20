import 'package:rive/rive.dart';

class RiveModel {
  final String src;
  final String artboard; // Nome do icon no Rive
  final String stateMachineName; // Timer interactivity (idle, active)
  late SMIBool? status;

  RiveModel({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    this.status
  });

  set setStatus(SMIBool state) {
    status = state;
  }
}