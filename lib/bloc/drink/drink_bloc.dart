import 'package:agony_coffee_app/bloc/drink/drink_event.dart';
import 'package:agony_coffee_app/bloc/drink/drink_state.dart';
import 'package:agony_coffee_app/repository/drink_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  final DrinkRepository drinkRepository;

  DrinkBloc(this.drinkRepository) : super(DrinkInitialState()) {
    on<FetchDrinksByCategoryIDEvent>((event, emit) async {
      try {
        emit(DrinkLoadingState(isLoading: true));
        final drinks = await drinkRepository.fetchDrinksByCategoryID(
            categoryID: event.categoryID, userID: event.userID);
        emit(FetchDrinksByCategoryIDSuccessState(drinkList: drinks));
        emit(DrinkLoadingState(isLoading: false));
      } catch (e) {
        emit(DrinkLoadingState(isLoading: false));
        emit(FetchDrinksByCategoryIDErrorState(message: e.toString()));
      }
    });
  }
}
