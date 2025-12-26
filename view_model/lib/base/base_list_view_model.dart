import 'package:flutter/foundation.dart';
import 'package:view_model/base/base_view_model.dart';

abstract interface class BaseListViewModel<T> implements BaseViewModel {
  ValueListenable<List<T>?> get items;
}
