part of '../model_response.dart';

sealed class LoginResponse extends ModelResponse {}

class ModelWrongCredentials extends LoginResponse {}

class ModelSuccessLogin extends LoginResponse {}
