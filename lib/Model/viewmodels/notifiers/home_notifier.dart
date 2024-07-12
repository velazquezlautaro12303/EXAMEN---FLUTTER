import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/entities/food.dart';
import 'package:flutter_application_3/Domain/providers/list_items_home.dart';
import 'package:flutter_application_3/Model/Repository/food_repository.dart';
import 'package:flutter_application_3/Model/viewmodels/states/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeNotifier extends Notifier<HomeState> {
  late final FoodRepository notesRepository = ref.read(foodRepositoryProvider);

  @override
  HomeState build() => HomeState();

  void refresh() async {
    final homeState = HomeState();
    homeState.foods = notesRepository.getAll();
    state = homeState;
  }

  void getAllById() async {
    final homeState = HomeState();
    homeState.foods = notesRepository.getAllByID();
    state = homeState;
  }

  Future<void> save(Food myFood) async {
    notesRepository.save(myFood);
    getAllById();
  }

  void onClickItem(String idItem, BuildContext context) {
    print(idItem);
    context.push("/detail/${idItem}");
  }
}
