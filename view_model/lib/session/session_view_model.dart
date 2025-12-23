import 'package:flutter/foundation.dart';

abstract interface class SessionViewModel {
  void logout();

  ValueListenable<String?> get fullName;
}
