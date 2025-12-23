import 'package:model/users/user_model.dart';

abstract interface class UserService {
  Future<List<UserModel>> loadUsers();

  Future<UserModel?> loadUser(String userId);
}
