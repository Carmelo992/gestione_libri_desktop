import 'package:flutter/foundation.dart';

abstract interface class BaseViewModel {
  ValueListenable<bool> get isLoading;
}
