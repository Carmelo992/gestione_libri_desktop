import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:view_model/login/login_view_model_impl.dart';

abstract interface class LoginViewModel {
  void login();

  TextEditingController get emailController;

  TextEditingController get passwordController;

  ValueListenable<bool> get isLoading;

  ValueListenable<LoginErrorResponseEnum?> get loginError;
}
