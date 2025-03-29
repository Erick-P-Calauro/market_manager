import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> getConnection() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      'database.db',
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL);',
        );
      },
      version: 3, // Mudar depois
    );

    return database;
  }
}
