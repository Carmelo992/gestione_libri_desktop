import 'package:flutter/foundation.dart';
import 'package:model/model.dart';
import 'package:view_model/users/user_ui_model.dart';
import 'package:view_model/users/users_view_model.dart';

class UsersViewModelImpl implements UsersViewModel {
  final UserService service;

  UsersViewModelImpl(T Function<T extends Object>() inject) : service = inject() {
    service.loadUsers().then((users) {
      this.users.value = users.map((user) => UserUIModel.fromModel(user)).toList();
    });
  }

  @override
  ValueNotifier<List<UserUIModel>> users = ValueNotifier<List<UserUIModel>>([]);
}
