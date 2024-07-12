// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_application_3/Domain/entities/configuration.dart';
import 'package:flutter_application_3/Domain/entities/food.dart';
import 'package:flutter_application_3/Domain/entities/user.dart';
import 'package:flutter_application_3/Model/Repository/imp/dao/configuration_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Food, MyUser, Configuration])
abstract class AppDatabase extends FloorDatabase {
  ConfigurationRepositoryDAO get configurationDao;
}
