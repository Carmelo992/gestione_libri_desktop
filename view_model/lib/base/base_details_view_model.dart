import 'package:flutter/foundation.dart';
import 'package:view_model/base/base_view_model.dart';

abstract interface class BaseDetailsViewModel<T> implements BaseViewModel {
  ValueListenable<T?> get details;

  void loadDetails(String id);
}
