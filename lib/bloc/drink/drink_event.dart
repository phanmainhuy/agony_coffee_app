abstract class DrinkEvent {}

class FetchAllDrinksEvent extends DrinkEvent {}

class FetchDrinksByCategoryIDEvent extends DrinkEvent {
  final int categoryID;
  final int userID;
  FetchDrinksByCategoryIDEvent(
      {required this.categoryID, required this.userID});
}
