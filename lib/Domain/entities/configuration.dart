import 'package:floor/floor.dart';

@entity
class Configuration {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final String value;

  Configuration({required this.name, required this.value});
}
