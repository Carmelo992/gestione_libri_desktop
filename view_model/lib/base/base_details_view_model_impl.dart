import 'package:flutter/foundation.dart';
import 'package:view_model/base/base_details_view_model.dart';
import 'package:view_model/base/base_view_model_impl.dart';

abstract class BaseDetailsViewModelImpl<UI_MODEL> extends BaseViewModelImpl implements BaseDetailsViewModel<UI_MODEL> {
  BaseDetailsViewModelImpl({required super.inject});

  @override
  void loadDetails(String yearId) async {
    isLoading.value = true;
    try {
      details.value = await loadItemDetails(yearId);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<UI_MODEL?> loadItemDetails(String id);

  @override
  ValueNotifier<UI_MODEL?> details = ValueNotifier(null);
}
