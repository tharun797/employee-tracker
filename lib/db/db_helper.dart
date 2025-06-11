import 'dart:convert';

import 'package:employee_tracker/data/employee_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'employee.db');
    final db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  static Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE employees (
        id INTEGER PRIMARY KEY,
        name TEXT,
        role TEXT,
        startDate TEXT,
        isActive INTEGER
      )
    ''');
    await _seedData(db);
  }

  // Load and insert initial data from JSON
  static Future<void> _seedData(Database db) async {
    final String jsonString = await rootBundle.loadString(
      'assets/employees.json',
    );
    final List<dynamic> data = json.decode(jsonString);
    for (var item in data) {
      final employee = EmployeeModel.fromJson(item);
      await db.insert('employees', employee.toMap());
    }
  }

  static Future<List<EmployeeModel>> fetchEmployees() async {
    final db = await database;
    final maps = await db.query('employees');
    return maps.map((map) => EmployeeModel.fromMap(map)).toList();
  }
}
