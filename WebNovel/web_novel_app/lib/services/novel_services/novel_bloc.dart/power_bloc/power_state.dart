import 'package:flutter/foundation.dart';

@immutable
abstract class PowerState {
  const PowerState();
}

class PowerStateInit implements PowerState {}

class PowerStateLoading implements PowerState {}

class PowerStateGetPower implements PowerState {
  final Map<String, dynamic> power;
  final Exception? exception;
  PowerStateGetPower({required this.power, required this.exception});
}