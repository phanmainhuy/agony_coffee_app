abstract class UserEvent {}

class LoginEvent extends UserEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends UserEvent {
  final String email;
  final String name;
  final String password;
  final String phone;

  RegisterEvent({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });
}

class FetchUserEvent extends UserEvent {}

class DeleteUserEvent extends UserEvent {
  final String userID;
  DeleteUserEvent({required this.userID});
}

class UpdateUserEvent extends UserEvent {
  final String email;
  final String name;
  final String phone;

  UpdateUserEvent({
    required this.email,
    required this.name,
    required this.phone,
  });
}
