class AuthModel {
  final String id;
  final String email;

  AuthModel({required this.id, required this.email});

  factory AuthModel.fromJson(final id, final email) =>
      AuthModel(id: id, email: email);
}
