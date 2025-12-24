import 'package:flutter/material.dart';
import 'package:model/auth/auth_model.dart';
import 'package:model/model.dart';
import 'package:model/model_response.dart';
import 'package:view_model/login/login_view_model.dart';

class LoginViewModelImpl implements LoginViewModel {
  final AuthService service;

  LoginViewModelImpl(T Function<T extends Object>() inject) : service = inject();
  @override
  TextEditingController emailController = TextEditingController(text: "admin@admin.it");

  @override
  TextEditingController passwordController = TextEditingController(text: "B33@ppSrl!");

  @override
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  ValueNotifier<LoginErrorResponseEnum?> loginError = ValueNotifier(null);

  @override
  void login() async {
    isLoading.value = true;
    try {
      var response = await service.login(AuthModel(email: emailController.text, password: passwordController.text));
      if (response is ModelSuccessLogin) {
        return;
      }

      loginError.value = switch (response) {
        ModelConnectionError() => LoginErrorResponseEnum.connectionError,
        ModelWrongCredentials() => LoginErrorResponseEnum.wrongCredentials,
        ModelGenericServerError() => LoginErrorResponseEnum.genericServerError,
        _ => null,
      };
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading.value = false;
  }
}

enum LoginErrorResponseEnum { connectionError, wrongCredentials, genericServerError }
