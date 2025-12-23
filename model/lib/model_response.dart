part 'auth/login_response.dart';
part 'auth/logout_response.dart';

sealed class ModelResponse {}

class ModelConnectionError extends ModelResponse {}

class ModelGenericServerError extends ModelResponse {}
