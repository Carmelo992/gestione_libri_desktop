class SessionModel {
  final String jwt;
  final String refreshToken;
  final String fullName;
  final int userId;

  const SessionModel({required this.jwt, required this.refreshToken, required this.userId, required this.fullName});
}
