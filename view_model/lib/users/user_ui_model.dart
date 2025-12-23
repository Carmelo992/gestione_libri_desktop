import 'package:model/model.dart';

class UserUIModel {
  final String userId;
  final String name;
  final String role;

  UserUIModel.fromModel(UserModel user) : userId = user.userId, name = user.name, role = user.role;
}
