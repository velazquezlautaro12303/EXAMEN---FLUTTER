import 'package:floor/floor.dart';
import 'package:flutter_application_3/Domain/entities/configuration.dart';

@dao
abstract class ConfigurationRepositoryDAO {
  @Query('SELECT * FROM CONFIGURATION WHERE NAME = :name')
  Future<Configuration?> read(String name);

  @insert
  Future<void> save(Configuration configuration);

  @Query("DELETE FROM CONFIGURATION WHERE NAME = :nameConfiguration")
  Future<void> delete(String nameConfiguration);
}
