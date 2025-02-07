import 'package:agony_coffee_app/models/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {
  final bool isLoading;
  UserLoadingState({required this.isLoading});
}

class UserLoginSuccessState extends UserState {
  final UserModel loginInfo;
  UserLoginSuccessState({required this.loginInfo});
}

class LoginUserErrorState extends UserState {
  final String? message;

  LoginUserErrorState({this.message});
}

class UserRegisterSuccessState extends UserState {
  final UserModel userModel;
  UserRegisterSuccessState({required this.userModel});
}

class RegisterUserErrorState extends UserState {
  final String? message;

  RegisterUserErrorState({this.message});
}

class FetchAllSuccessState extends UserState {
  final List<UserModel> listUser;
  FetchAllSuccessState({required this.listUser});
}

class FetchAllErrorState extends UserState {
  final String? message;

  FetchAllErrorState({this.message});
}

class DeleteUserEventSuccess extends UserState {
  final String userID;
  DeleteUserEventSuccess({required this.userID});
}

class DeleteUserErrorState extends UserState {
  final String? message;

  DeleteUserErrorState({this.message});
}

class UpdateUserSuccessState extends UserState {}

class UpdateUserErrorState extends UserState {
  final String? message;

  UpdateUserErrorState({this.message});
}

class UserErrorState extends UserState {
  final String? message;

  UserErrorState({this.message});
}
