import 'package:flutter_application_3/Domain/entities/food.dart';

abstract class FoodRepository {
  Future<void> save(final Food food);

  Future<Food> findById(final String id);

  Future<void> removeById(final String id);

  Future<List<Food>> getAll();

  Future<List<Food>> getAllByID();

  Future<void> update(Food food);
}
