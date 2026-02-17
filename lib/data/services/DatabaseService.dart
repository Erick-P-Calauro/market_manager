import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> getConnection() async {
    WidgetsFlutterBinding.ensureInitialized();
    final databasesPath = await getDatabasesPath();

    final database = openDatabase(
      "$databasesPath/market.db",
      
      onCreate: (db, version) async {
        Batch batch = db.batch();
        createDatabaseEntities(batch);

        await batch.commit();
      },

      onUpgrade: (db, oldVersion, newVersion) async {
        Batch batch = db.batch();
        createDatabaseEntities(batch); 

        await batch.commit();
      },

      onDowngrade: onDatabaseDowngradeDelete,
      version: 1, // Mudar depois
    );

    return database;
  }
}

// Os batchs devem ser escrtos de maneira independente
void createDatabaseEntities(Batch batch) {
  batch.execute('''
    CREATE TABLE IF NOT EXISTS category(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name VARCHAR(30) NOT NULL
    );
  ''');

  print("CATEGORY CREATED");

  batch.execute('''
    CREATE TABLE IF NOT EXISTS unity(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name VARCHAR(30) NOT NULL, 
      abbreviation VARCHAR(3) NOT NULL
    );
  ''');

  print("MEASURE UNITY CREATED");

  batch.execute('''
    CREATE TABLE IF NOT EXISTS product(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name VARCHAR(30) NOT NULL,
      category INTEGER,
      barcode VARCHAR(20),
      FOREIGN KEY (category) REFERENCES category(id)
    );
  ''');

  print("PRODUCT CREATED");

  batch.execute('''
    CREATE TABLE IF NOT EXISTS shop(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(60) NOT NULL,
      date INT NOT NULL
    );
  ''');

  print("SHOP CREATED");

  batch.execute('''
    CREATE TABLE IF NOT EXISTS item(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      quantity INTEGER NOT NULL,
      price INTEGER,
      product INTEGER,
      shop INTEGER,
      unity INTEGER,
      FOREIGN KEY (product) REFERENCES product(id),
      FOREIGN KEY (shop) REFERENCES shop(id),
      FOREIGN KEY (unity) REFERENCES unity(id)
    );
  ''');

  print("ITEM CREATED");
}