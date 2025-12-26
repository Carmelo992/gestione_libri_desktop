import 'package:flutter/foundation.dart';
import 'package:model/session/session_model.dart';

abstract interface class SessionService {
  ValueListenable<SessionModel?> get session;

  void userLogged(SessionModel model);

  void userLoggedOut();

  String? bearerToken();
}
