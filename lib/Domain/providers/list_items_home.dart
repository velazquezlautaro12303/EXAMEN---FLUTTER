import 'package:flutter_application_3/Model/Repository/food_repository.dart';
import 'package:flutter_application_3/Model/Repository/imp/foods_repository_firebase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final foodRepositoryProvider = Provider<FoodRepository>(
  (ref) => FoodRepositoryFirebase(),
);
