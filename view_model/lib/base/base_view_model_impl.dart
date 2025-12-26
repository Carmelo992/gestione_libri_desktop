import 'package:flutter/foundation.dart';
import 'package:view_model/base/base_view_model.dart';

abstract class BaseViewModelImpl implements BaseViewModel {
  T Function<T extends Object>() inject;

  BaseViewModelImpl({required this.inject});

  @override
  ValueNotifier<bool> isLoading = ValueNotifier(false);
}
