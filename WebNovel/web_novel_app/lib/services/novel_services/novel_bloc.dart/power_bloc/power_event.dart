import 'package:flutter/foundation.dart';

@immutable
abstract class PowerEvent {
  const PowerEvent();
}

class PowerEventGetPower implements PowerEvent {
  final String novelId;
  PowerEventGetPower({required this.novelId});
}

class PowerEventSendPower implements PowerEvent {
  final String novelId;
  PowerEventSendPower({required this.novelId});
}
