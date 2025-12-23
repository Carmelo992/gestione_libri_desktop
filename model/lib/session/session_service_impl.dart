import 'package:flutter/foundation.dart';
import 'package:model/session/session_model.dart';
import 'package:model/session/session_service.dart';

class SessionServiceImpl implements SessionService {
  @override
  ValueNotifier<SessionModel?> session = ValueNotifier(null);

  @override
  void userLogged(SessionModel model) {
    session.value = model;
  }

  @override
  void userLoggedOut() {
    session.value = null;
  }
}
