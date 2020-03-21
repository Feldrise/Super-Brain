import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_brain/Models/DreamItem.dart';
import 'package:super_brain/Models/JournalItem.dart';

final String tableDreams = 'dreams';
final String dreamsColumnId = '_id';
final String dreamsColumnDate = 'date';
final String dreamsColumnText = 'text';

final String tableJournals = 'journals';
final String journalsColumnId = '_id';
final String journalsColumnTitle = 'title';
final String journalsColumnContent = 'content';

class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "BrainDatabase.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 2;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,);
  }

  // SQL string to create the database 
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableDreams (
            $dreamsColumnId INTEGER PRIMARY KEY,
            $dreamsColumnDate TEXT NOT NULL,
            $dreamsColumnText TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableJournals (
            $journalsColumnId INTEGER PRIMARY KEY,
            $journalsColumnTitle TEXT NOT NULL,
            $journalsColumnContent TEXT NOT NULL
          )
          ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
          CREATE TABLE $tableJournals (
            $journalsColumnId INTEGER PRIMARY KEY,
            $journalsColumnTitle TEXT NOT NULL,
            $journalsColumnContent TEXT NOT NULL
          )
          ''');
  }    
  
  // Database helper methods:

  Future<int> insertDream(DreamItem dream) async {
    Database db = await database;
    int id = await db.insert(tableDreams, dream.toMap());

    return id;
  }

  Future<DreamItem> queryDream(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableDreams,
      columns: [dreamsColumnId, dreamsColumnDate, dreamsColumnText],
      where: '$dreamsColumnId = ?',
      whereArgs: [id]
    );

    if (maps.length > 0) {
      return DreamItem.fromMap(maps.first);
    }

    return null;
  }

  Future<Set<DreamItem>> queryAllDreams() async {
    Database db = await database;
    Set<DreamItem> allDreams = Set<DreamItem>();

    List<Map> maps = await db.query(tableDreams,
      columns: [dreamsColumnId, dreamsColumnDate, dreamsColumnText],
    );

    for (var dream in maps) {
      allDreams.add(DreamItem.fromMap(dream));
    }

    return allDreams;

  }

  Future<void> deleteDream(int id) async {
    Database db = await database;
    db.delete(tableDreams,
      where: '$dreamsColumnId = ?',
      whereArgs: [id]
    );
  }
  
  Future<void> updateDream(DreamItem dreamItem) async {
    Database db = await database;
    db.update(tableDreams, dreamItem.toMap(),
      where: '$dreamsColumnId = ?',
      whereArgs: [dreamItem.id]
    );
  }

  
  Future<int> insertJournal(JournalItem journal) async {
    Database db = await database;
    int id = await db.insert(tableJournals, journal.toMap());

    return id;
  }

  Future<JournalItem> queryJournal(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableJournals,
      columns: [journalsColumnId, journalsColumnTitle, journalsColumnContent],
      where: '$journalsColumnId = ?',
      whereArgs: [id]
    );

    if (maps.length > 0) {
      return JournalItem.fromMap(maps.first);
    }

    return null;
  }

  Future<Set<JournalItem>> queryAllJournals() async {
    Database db = await database;
    Set<JournalItem> allJournals = Set<JournalItem>();

    List<Map> maps = await db.query(tableJournals,
      columns: [journalsColumnId, journalsColumnTitle, journalsColumnContent],
    );

    for (var journal in maps) {
      allJournals.add(JournalItem.fromMap(journal));
    }

    return allJournals;

  }

  Future<void> deleteJournal(int id) async {
    Database db = await database;
    db.delete(tableJournals,
      where: '$journalsColumnId = ?',
      whereArgs: [id]
    );
  }
  
  Future<void> updateJournal(JournalItem journalItem) async {
    Database db = await database;
    db.update(tableJournals, journalItem.toMap(),
      where: '$journalsColumnId = ?',
      whereArgs: [journalItem.id]
    );
  }
}