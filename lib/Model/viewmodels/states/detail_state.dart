import 'package:flutter_application_3/Domain/entities/food.dart';

class DetailState {
  late Future<Food> food;
  bool modeEdit;

  DetailState({required this.modeEdit});
}
