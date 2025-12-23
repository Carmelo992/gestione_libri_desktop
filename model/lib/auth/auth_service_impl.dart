import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:model/api/auth/login_request.dart';
import 'package:model/api/auth/rest_auth.dart';
import 'package:model/auth/auth_model.dart';
import 'package:model/auth/auth_service.dart';
import 'package:model/injectable.dart';
import 'package:model/model_response.dart';
import 'package:model/session/session_model.dart';
import 'package:model/session/session_service.dart';

class AuthServiceImpl extends Injectable implements AuthService {
  SessionService sessionService;
  late RestAuth client;

  AuthServiceImpl(super.inject) : sessionService = inject() {
    Dio dio = Dio();
    dio.interceptors.add(
      AwesomeDioInterceptor(logRequestTimeout: false, logResponseHeaders: false, logger: debugPrint),
    );
    client = RestAuth(dio);
  }

  @override
  Future<ModelResponse> login(AuthModel model) async {
    try {
      var response = await client.login(LoginRequestModel(email: model.email, password: model.password));
      sessionService.userLogged(
        SessionModel(
          jwt: response.token,
          refreshToken: response.refreshToken,
          userId: response.id,
          fullName: response.firstName,
        ),
      );

      return ModelSuccessLogin();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout) {
        return ModelConnectionError();
      }
      if (e.type == DioExceptionType.badResponse) {
        return ModelWrongCredentials();
      }
      return ModelGenericServerError();
    }
  }

  @override
  Future<ModelResponse> logout() async {
    var jwt = sessionService.session.value?.jwt;
    try {
      if (jwt != null) {
        client.logout("Bearer $jwt");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    sessionService.userLoggedOut();
    return ModelLogoutSuccess();
  }
}
