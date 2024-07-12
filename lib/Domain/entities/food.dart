import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floor/floor.dart';

@entity
class Food {
  @PrimaryKey(autoGenerate: true)
  final String? id;
  final String title;
  final String subtitle;
  final String description;
  final int price;
  final String imageUrl;
  final String userId;
  final bool isActived;

  Food({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.userId,
    required this.isActived,
  });

  Food copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? description,
    int? price,
    bool? isActived,
  }) {
    return Food(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl,
      userId: userId,
      isActived: isActived ?? this.isActived,
    );
  }

  factory Food.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Food(
      id: snapshot.id,
      title: data?['title'],
      subtitle: data?['subtitle'],
      description: data?['description'],
      price: data?['price'],
      imageUrl: data?['imageUrl'],
      userId: data?['userId'],
      isActived: data?['isActived'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (subtitle != null) "subtitle": subtitle,
      if (description != null) "description": description,
      if (price != null) "price": price,
      if (imageUrl != null) "imageUrl": imageUrl,
      if (userId != null) "userId": userId,
      if (isActived != null) "isActived": isActived,
    };
  }
}
