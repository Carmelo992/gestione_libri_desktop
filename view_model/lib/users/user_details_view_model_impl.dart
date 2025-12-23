import 'package:flutter/foundation.dart';
import 'package:model/model.dart';
import 'package:view_model/users/user_details_view_model.dart';
import 'package:view_model/users/user_ui_model.dart';

class UserDetailsViewModelImpl implements UserDetailsViewModel {
  final UserService service;

  UserDetailsViewModelImpl(T Function<T extends Object>() inject) : service = inject();

  @override
  void loadUser(String userId) {
    isLoading.value = true;
    service.loadUser(userId).then((user) {
      if (user == null) {
        this.user.value = null;
        isLoading.value = false;
        return;
      }
      this.user.value = UserUIModel.fromModel(user);
      isLoading.value = false;
    });
  }

  @override
  ValueNotifier<UserUIModel?> user = ValueNotifier(null);

  @override
  ValueNotifier<bool> isLoading = ValueNotifier(false);
}
