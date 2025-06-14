import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> getConnection() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      'database.db',
      
      onCreate: (db, version) async {
        Batch batch = db.batch();
        createDatabaseEntities(batch);
        print("\nDatabase created ($version)\n");

        await batch.commit();
      },

      onUpgrade: (db, oldVersion, newVersion) async {
        Batch batch = db.batch();
        createDatabaseEntities(batch); 
        print("\nDatabase upgraded ($oldVersion : $newVersion)\n");

        await batch.commit();
      },

      onDowngrade: onDatabaseDowngradeDelete,
      version: 2, // Mudar depois
    );

    return database;
  }
}

void createDatabaseEntities(Batch batch) {
  batch.execute('''
    CREATE TABLE IF NOT EXISTS category(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name VARCHAR(30) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS unity(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name VARCHAR(30) NOT NULL, 
      abbreviation VARCHAR(3) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS product(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name VARCHAR(30) NOT NULL,
      category INTEGER FOREIGN KEY REFERENCES category
      price NUMERIC(10,2) NOT NULL,
      unity INTEGER FOREIGN KEY REFERENCES unity,
      barcode VARCHAR(20),
    );

    CREATE TABLE IF NOT EXISTS item(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      quantity INTEGER NOT NULL,
      onCart BOOLEAN NOT NULL,
      product INTEGER FOREIGN KEY REFERENCES product,
      shop INTEGER FOREIGN KEY REFERENCES shop
    );

    CREATE TABLE IF NOT EXISTS shop(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      description TEXT,
      date DATE NOT NULL
    );
  ''');
}