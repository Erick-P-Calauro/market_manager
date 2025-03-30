import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> getConnection() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      'database.db',
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(30) NOT NULL);');
        db.execute(
            'CREATE TABLE unity(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(30) NOT NULL, abbreviation VARCHAR(3) NOT NULL);');
      },
      version: 3, // Mudar depois
    );

    return database;
  }
}
