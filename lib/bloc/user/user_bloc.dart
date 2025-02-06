import 'package:agony_coffee_app/bloc/user/user_event.dart';
import 'package:agony_coffee_app/bloc/user/user_state.dart';
import 'package:agony_coffee_app/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitialState()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(UserLoadingState(isLoading: true));
        await userRepository.login(
          email: event.email,
          password: event.password,
        );
        emit(UserLoadingState(isLoading: false));
        emit(UserLoginSuccessState());
      } catch (e) {
        emit(UserLoadingState(isLoading: false));
        emit(LoginUserErrorState(message: e.toString()));
      }
    });

    on<RegisterEvent>((event, emit) async {
      try {
        emit(UserLoadingState(isLoading: true));
        await userRepository.register(
            email: event.email,
            password: event.password,
            name: event.name,
            phone: event.phone);
        emit(UserLoadingState(isLoading: false));
        emit(UserRegisterSuccessState());
      } catch (e) {
        emit(UserLoadingState(isLoading: false));
        emit(RegisterUserErrorState(message: e.toString()));
      }
    });

    on<FetchUserEvent>((event, emit) async {
      try {
        emit(UserLoadingState(isLoading: true));

        final users = await userRepository.fetchAllUser();
        emit(FetchAllSuccessState(listUser: users));
        emit(UserLoadingState(isLoading: false));
      } catch (e) {
        emit(UserLoadingState(isLoading: false));
        emit(FetchAllErrorState(message: e.toString()));
      }
    });

    on<DeleteUserEvent>((event, emit) async {
      try {
        emit(UserLoadingState(isLoading: true));
        await userRepository.deleteUser(userID: event.userID);

        emit(DeleteUserEventSuccess(userID: event.userID));

        emit(UserLoadingState(isLoading: false));
      } catch (e) {
        emit(UserLoadingState(isLoading: false));
        emit(DeleteUserErrorState(message: e.toString()));
      }
    });

    on<UpdateUserEvent>((event, emit) async {
      try {
        emit(UserLoadingState(isLoading: true));
        await userRepository.updateUser(
            email: event.email, name: event.name, phone: event.phone);
        emit(UserLoadingState(isLoading: false));
        emit(UpdateUserSuccessState());
      } catch (e) {
        emit(UserLoadingState(isLoading: false));
        emit(UpdateUserErrorState(message: e.toString()));
      }
    });
  }
}
