import 'package:flutter/foundation.dart';
import 'package:view_model/base/base_list_view_model.dart';
import 'package:view_model/base/base_view_model_impl.dart';

abstract class BaseListViewModelImpl<UI_MODEL> extends BaseViewModelImpl implements BaseListViewModel<UI_MODEL> {
  BaseListViewModelImpl({required super.inject}) {
    _initialLoading();
  }

  Future<void> _initialLoading() async {
    isLoading.value = true;
    try {
      refreshItems();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> refreshItems() async {
    try {
      var items = await loadItems();
      this.items.value = items;
    } catch (e) {
      print(e);
    }
  }

  Future<List<UI_MODEL>> loadItems();

  @override
  ValueNotifier<List<UI_MODEL>?> items = ValueNotifier(null);
}
