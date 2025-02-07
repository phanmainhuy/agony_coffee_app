import 'package:agony_coffee_app/bloc/cart/cart_bloc.dart';
import 'package:agony_coffee_app/bloc/category/category_bloc.dart';
import 'package:agony_coffee_app/bloc/drink/drink_bloc.dart';
import 'package:agony_coffee_app/bloc/user/user_bloc.dart';
import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_routes.dart';
import 'package:agony_coffee_app/constants/const.dart';
import 'package:agony_coffee_app/pages/splash/splash_page.dart';
import 'package:agony_coffee_app/repository/cart_repsitory.dart';
import 'package:agony_coffee_app/repository/category_repository.dart';
import 'package:agony_coffee_app/repository/drink_repository.dart';
import 'package:agony_coffee_app/repository/user_repository.dart';
import 'package:agony_coffee_app/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  final userRepository = UserRepository();
  final categoryRepository = CategoryRepository();
  final drinkRepository = DrinkRepository();
  final cartRepository = CartRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(categoryRepository),
        ),
        BlocProvider(
          create: (context) => DrinkBloc(drinkRepository),
        ),
        BlocProvider(
          create: (context) => CartBloc(cartRepository),
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
        home: const SplashPage());
  }
}
