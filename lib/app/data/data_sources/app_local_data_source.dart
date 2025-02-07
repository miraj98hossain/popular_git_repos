import 'dart:convert';

import 'package:sqflite/sqflite.dart';

abstract class AppLocalDataSource {}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final Database _database;

  AppLocalDataSourceImpl({required Database database}) : _database = database;
}
