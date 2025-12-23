import 'package:model/injectable.dart';
import 'package:model/session/session_service.dart';
import 'package:model/users/dummy_users.dart';
import 'package:model/users/user_model.dart';
import 'package:model/users/user_service.dart';

class UserServiceImpl extends Injectable implements UserService {
  SessionService sessionService;

  UserServiceImpl(super.inject) : sessionService = inject();

  @override
  Future<List<UserModel>> loadUsers() async {
    await Future.delayed(Duration(seconds: 1));
    return dummyUsers;
  }

  @override
  Future<UserModel?> loadUser(String userId) async {
    await Future.delayed(Duration(seconds: 1));
    return dummyUsers.where((user) => user.userId == userId).firstOrNull;
  }
}
