import 'package:agony_coffee_app/bloc/category/category_event.dart';
import 'package:agony_coffee_app/bloc/category/category_state.dart';
import 'package:agony_coffee_app/repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitialState()) {
    on<FetchAllCategoriesEvent>((event, emit) async {
      try {
        emit(CategoryLoadingState(isLoading: true));
        final categories = await categoryRepository.fetchAllCategories();
        emit(FetchAllSuccessState(categoryList: categories));
        emit(CategoryLoadingState(isLoading: false));
      } catch (e) {
        emit(CategoryLoadingState(isLoading: false));
        emit(FetchAllErrorState(message: e.toString()));
      }
    });
  }
}
