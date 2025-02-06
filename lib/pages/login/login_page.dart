import 'package:agony_coffee_app/bloc/user/user_bloc.dart';
import 'package:agony_coffee_app/bloc/user/user_event.dart';
import 'package:agony_coffee_app/bloc/user/user_state.dart';
import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_routes.dart';
import 'package:agony_coffee_app/models/user_model.dart';
import 'package:agony_coffee_app/pages/components/dialogs/error_dialog.dart';
import 'package:agony_coffee_app/pages/components/dialogs/loading_dialog.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_elevated_button.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_logo_title.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_text_field_title.dart';
import 'package:agony_coffee_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocConsumer<UserBloc, UserState>(
              builder: (builderContext, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppLogoTitle(),
                    AppTextFieldTitle(
                        textController: _emailController,
                        textTitle: 'Your email address',
                        hintText: 'Ex: example@gmail.com'),

                    // Password Input Field
                    AppTextFieldTitle(
                        isPassword: true,
                        textController: _passwordController,
                        textTitle: 'Your password',
                        hintText: 'Min. 8 characters'),

                    const SizedBox(height: 8),

                    AppElevatedButton(
                      buttonText: 'Login',
                      backgroundColor: AppColors.whiteColor,
                      onPress: () {
                        String email = _emailController.text.toString();
                        String password = _passwordController.text.toString();
                        if (Utils.checkEmptyString(email) ||
                            Utils.checkEmptyString(password)) {
                          _showErrorDialog(
                            message: 'Please enter the empty field',
                          );
                          return;
                        }
                        context.read<UserBloc>().add(
                              LoginEvent(
                                email: email,
                                password: password,
                              ),
                            );
                      },
                    ),

                    const SizedBox(height: 12),

                    InkWell(
                      onTap: () {
                        navigatorKey.currentState
                            ?.pushNamed(RouteName.registerRoute);
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up now',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              listener: (BuildContext context, UserState state) async {
                switch (state.runtimeType) {
                  case UserLoadingState:
                    if ((state as UserLoadingState).isLoading) {
                      try {
                        LoadingDialog.show(context, message: "Loading...");
                      } catch (e) {
                        LoadingDialog.hide(context);
                      }
                    } else {
                      LoadingDialog.hide(context);
                    }
                    break;

                  case LoginUserErrorState:
                    _showErrorDialog(
                      message:
                          (state as LoginUserErrorState).message.toString(),
                    );
                    break;

                  case UserLoginSuccessState:
                    navigatorKey.currentState?.pushNamedAndRemoveUntil(
                      RouteName.homeRoute,
                      (Route<dynamic> route) => false,
                    );
                    break;
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog({
    required String message,
  }) {
    ErrorDialog.show(
      context: context,
      title: "Login Failed",
      content: message,
    );
  }
}
