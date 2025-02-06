import 'package:agony_coffee_app/bloc/user/user_bloc.dart';
import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_routes.dart';
import 'package:agony_coffee_app/constants/const.dart';
import 'package:agony_coffee_app/pages/splash/splash_page.dart';
import 'package:agony_coffee_app/repository/user_repository.dart';
import 'package:agony_coffee_app/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  final userRepository = UserRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.generatedRoute,
      initialRoute: RouteName.splashRoute,
      home: const SplashPage(),
    );
  }
}
