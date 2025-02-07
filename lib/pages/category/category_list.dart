import 'package:agony_coffee_app/bloc/category/category_bloc.dart';
import 'package:agony_coffee_app/bloc/category/category_event.dart';
import 'package:agony_coffee_app/bloc/category/category_state.dart';
import 'package:agony_coffee_app/models/category_model.dart';
import 'package:agony_coffee_app/models/user_model.dart';
import 'package:agony_coffee_app/pages/category/cards/category_card.dart';
import 'package:agony_coffee_app/pages/components/dialogs/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatefulWidget {
  final UserModel user;
  const CategoryList({super.key, required this.user});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(FetchAllCategoriesEvent());
  }

  List<CategoryModel> categories = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case CategoryLoadingState:
            if ((state as CategoryLoadingState).isLoading) {
              try {
                LoadingDialog.show(context, message: "Loading...");
              } catch (e) {
                LoadingDialog.hide(context);
              }
            } else {
              LoadingDialog.hide(context);
            }
            break;

          case FetchAllSuccessState:
            categories = (state as FetchAllSuccessState).categoryList;
            break;
        }
      },
      builder: (context, state) {
        return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryCard(
                category: category,
                user: widget.user,
              );
            });
      },
    );
  }
}
