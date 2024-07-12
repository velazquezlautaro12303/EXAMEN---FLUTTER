import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/Domain/entities/food.dart';
import 'package:flutter_application_3/Model/Repository/food_repository.dart';

class FoodRepositoryFirebase extends FoodRepository {
  final db = FirebaseFirestore.instance;
  final nameTable = "food";

  @override
  Future<Food> findById(String id) async {
    final querySnapshot = await db.collection(nameTable).doc(id).get();
    return Food.fromFirestore(querySnapshot, null);
  }

  @override
  Future<List<Food>> getAll() async {
    List<Food> foods = [];
    final querySnapshot = await db
        .collection(nameTable)
        .where('isActived', isEqualTo: true)
        .get();
    try {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
        foods.add(Food.fromFirestore(docSnapshot, null));
      }
    } catch (e) {
      print("Error completing: $e");
    }
    return foods;
  }

  @override
  Future<void> update(Food food) async {
    await db.collection(nameTable).doc(food.id).update(food.toFirestore());
  }

  @override
  Future<void> removeById(String id) async {
    await db.collection(nameTable).doc(id).update({'isActived': false});
  }

  @override
  Future<void> save(Food food) async {
    await db.collection(nameTable).add(food.toFirestore());
  }

  @override
  Future<List<Food>> getAllByID() async {
    List<Food> foods = [];
    final querySnapshot = await db
        .collection(nameTable)
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isActived', isEqualTo: true)
        .get();
    for (var docSnapshot in querySnapshot.docs) {
      foods.add(Food.fromFirestore(docSnapshot, null));
    }
    return foods;
  }
}
