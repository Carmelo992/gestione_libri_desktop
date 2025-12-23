import 'package:flutter/foundation.dart';
import 'package:view_model/users/user_ui_model.dart';

abstract interface class UserDetailsViewModel {
  ValueListenable<UserUIModel?> get user;

  ValueListenable<bool> get isLoading;

  void loadUser(String userId);
}
