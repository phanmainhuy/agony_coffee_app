import 'package:agony_coffee_app/bloc/user/user_bloc.dart';
import 'package:agony_coffee_app/bloc/user/user_event.dart';
import 'package:agony_coffee_app/bloc/user/user_state.dart';
import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_routes.dart';
import 'package:agony_coffee_app/pages/components/dialogs/error_dialog.dart';
import 'package:agony_coffee_app/pages/components/dialogs/loading_dialog.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_elevated_button.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_logo_title.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_text_field_title.dart';
import 'package:agony_coffee_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: BlocConsumer<UserBloc, UserState>(
          builder: (builderContext, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),
                        const AppLogoTitle(),
                        AppTextFieldTitle(
                            textController: _emailController,
                            textTitle: 'Your email address',
                            hintText: 'Ex: example@gmail.com'),
                        AppTextFieldTitle(
                            textController: _nameController,
                            textTitle: 'Your name',
                            hintText: 'Ex: Nhu Y'),
                        AppTextFieldTitle(
                            textController: _phoneNumberController,
                            textTitle: 'Your phone number',
                            hintText: 'Ex: 0123456'),
                        AppTextFieldTitle(
                            isPassword: true,
                            textController: _passwordController,
                            textTitle: 'Your password',
                            hintText: 'Min. 8 characters'),
                        AppTextFieldTitle(
                            isPassword: true,
                            textController: _repasswordController,
                            textTitle: 'Your repassword',
                            hintText: 'Min. 8 characters'),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // Register Button
                const SizedBox(height: 16), // Add spacing below the button

                AppElevatedButton(
                  buttonText: 'Register',
                  backgroundColor: AppColors.whiteColor,
                  onPress: () {
                    String password = _passwordController.text.toString();
                    String rePassword = _repasswordController.text.toString();
                    String email = _emailController.text.toString();
                    String name = _nameController.text.toString();
                    String phone = _phoneNumberController.text.toString();
                    if (Utils.checkEmptyString(email) ||
                        Utils.checkEmptyString(name) ||
                        Utils.checkEmptyString(phone) ||
                        Utils.checkEmptyString(password) ||
                        Utils.checkEmptyString(rePassword)) {
                      _showErrorDialog(
                        message: 'Please enter the empty field',
                      );
                      return;
                    }
                    if (password != rePassword) {
                      _showErrorDialog(
                        message: 'Password and repassword is not match',
                      );
                    } else {
                      context.read<UserBloc>().add(
                            RegisterEvent(
                              email: email,
                              password: password,
                              name: name,
                              phone: phone,
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          },
          listener: (BuildContext context, UserState state) {
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

              case RegisterUserErrorState:
                _showErrorDialog(
                  message: (state as RegisterUserErrorState).message.toString(),
                );
                break;

              case UserRegisterSuccessState:
                navigatorKey.currentState?.pushNamedAndRemoveUntil(
                  RouteName.homeRoute,
                  (Route<dynamic> route) => false,
                );
                break;
            }
          },
        ),
      ),
    );
  }

  void _showErrorDialog({
    required String message,
  }) {
    ErrorDialog.show(
      context: context,
      title: "Register Failed",
      content: message,
    );
  }
}
