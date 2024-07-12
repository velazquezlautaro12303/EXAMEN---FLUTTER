import 'package:flutter_application_3/Domain/entities/food.dart';
import 'package:flutter_application_3/Domain/providers/list_items_home.dart';
import 'package:flutter_application_3/Model/Repository/food_repository.dart';
import 'package:flutter_application_3/Model/viewmodels/states/detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailNotifier extends Notifier<DetailState> {
  @override
  DetailState build() => DetailState(modeEdit: false);
  late final FoodRepository notesRepository = ref.read(foodRepositoryProvider);

  Future<void> search(String id) async {
    final detailState = DetailState(modeEdit: false);
    detailState.food = notesRepository.findById(id);
    state = detailState;
  }

  void delete(String id) {
    notesRepository.removeById(id);
  }

  void save(Food food) {
    notesRepository.save(food);
  }

  Future<void> cambiarMode(String id) async {
    final newState = DetailState(modeEdit: !state.modeEdit);
    newState.food = notesRepository.findById(id);
    state = newState;
  }

  void update(Food food) {
    notesRepository.update(food);
  }

  void onTap(Food food) {
    if (!state.modeEdit) {
      delete(food.id!);
    } else {
      update(food);
    }
  }
}
