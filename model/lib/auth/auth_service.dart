import 'package:model/auth/auth_model.dart';
import 'package:model/model_response.dart';

abstract interface class AuthService {
  Future<ModelResponse> login(AuthModel model);

  Future<ModelResponse> logout();
}
