import 'package:agony_coffee_app/models/category_model.dart';

abstract class CategoryState {}

final class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {
  final bool isLoading;
  CategoryLoadingState({required this.isLoading});
}

class FetchAllSuccessState extends CategoryState {
  final List<CategoryModel> categoryList;
  FetchAllSuccessState({required this.categoryList});
}

class FetchAllErrorState extends CategoryState {
  final String? message;

  FetchAllErrorState({this.message});
}
