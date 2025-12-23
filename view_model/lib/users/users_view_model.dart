import 'package:flutter/foundation.dart';
import 'package:view_model/users/user_ui_model.dart';

abstract interface class UsersViewModel {
  ValueListenable<List<UserUIModel>> get users;
}
