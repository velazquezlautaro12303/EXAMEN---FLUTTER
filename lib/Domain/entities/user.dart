import 'package:floor/floor.dart';

@entity
class MyUser {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String username;
  final String password;

  MyUser({
    required this.id,
    required this.username,
    required this.password,
  });

  @override
  bool operator ==(Object other) {
    return other is MyUser &&
        username == other.username &&
        password == other.password;
  }
}
