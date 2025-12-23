import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:view_model/session/session_view_model.dart';

class SessionViewModelImpl implements SessionViewModel {
  final AuthService authService;
  final SessionService sessionService;

  SessionViewModelImpl(T Function<T extends Object>() inject) : authService = inject(), sessionService = inject() {
    sessionService.session.addListener(() {
      fullName.value = sessionService.session.value?.fullName;
    });
  }

  @override
  void logout() {
    authService.logout();
  }

  @override
  ValueNotifier<String?> fullName = ValueNotifier(null);
}
