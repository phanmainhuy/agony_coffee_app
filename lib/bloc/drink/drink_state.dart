import 'package:agony_coffee_app/models/drink_model.dart';

abstract class DrinkState {}

final class DrinkInitialState extends DrinkState {}

class DrinkLoadingState extends DrinkState {
  final bool isLoading;
  DrinkLoadingState({required this.isLoading});
}

class FetchAllSuccessState extends DrinkState {
  final List<DrinkModel> drinkList;
  FetchAllSuccessState({required this.drinkList});
}

class FetchAllErrorState extends DrinkState {
  final String? message;

  FetchAllErrorState({this.message});
}

class FetchDrinksByCategoryIDSuccessState extends DrinkState {
  final List<DrinkModel> drinkList;
  FetchDrinksByCategoryIDSuccessState({required this.drinkList});
}

class FetchDrinksByCategoryIDErrorState extends DrinkState {
  final String? message;

  FetchDrinksByCategoryIDErrorState({this.message});
}
