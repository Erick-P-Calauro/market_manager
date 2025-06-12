import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> getConnection() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      'database.db',
      onCreate: (db, version) async {
        Batch batch = db.batch();

        batch.execute('''
          CREATE TABLE category(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name VARCHAR(30) NOT NULL
          );
        ''');

        batch.execute('''
          CREATE TABLE unity(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name VARCHAR(30) NOT NULL, 
            abbreviation VARCHAR(3) NOT NULL
          );
        ''');

        await batch.commit();
      },

      onUpgrade: (db, oldVersion, newVersion) async {
          Batch batch = db.batch();
          if (oldVersion == 1) {

            

            batch.execute('''
              CREATE TABLE unity(
                id INTEGER PRIMARY KEY AUTOINCREMENT, 
                name VARCHAR(30) NOT NULL, 
                abbreviation VARCHAR(3) NOT NULL
              );
            ''');
          }
          await batch.commit();
        },

        onDowngrade: onDatabaseDowngradeDelete,
      version: 2, // Mudar depois
    );

    return database;
  }
}
