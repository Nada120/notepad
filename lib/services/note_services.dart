import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/note.dart';

class NoteDatabase{
  static final NoteDatabase instance = NoteDatabase._init();

  static Database? _database;

  NoteDatabase._init();
  

  // To create the table only once
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  // To create the path of databse 
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  
  // Build the Notes table In database
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Notes (
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        importance TEXT NOT NULL,
        createdTime TEXT NOT NULL,
        lastUpdated TEXT NOT NULL,
        )
    ''');
  }

  // inseart the data in database
  Future<Note> create(Note note) async {
    final db = await instance.database;
    
    final saveData  = await db.rawInsert('''
      INSERT INTO Notes(title, content, importance, createdTime, lastUpdated) VALUES(?,?,?,?,?);
    ''', [note.title, note.content, note.importance, note.createdTime, note.lastUpdated]);
    debugPrint('Data is added in the database $saveData');
    // await db.insert('Notes', note.toJson()).then((_) {
    //   debugPrint('Data is added in the database *****');
    // });
    return note;
  }
  
  // read all the data in the database
  Future<List<dynamic>> readAllNote() async {
    final db = await instance.database;
    List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM Notes');
    if (result.isNotEmpty) {
      List<dynamic> note = [];
      for (int i=0; i<result.length; i++) {
        note.add({
          'title': result[i]['title'], 
          'content': result[i]['content'], 
          'importance': result[i]['importance'],
          'createdTime': result[i]['createdTime'], 
          'lastUpdated': result[i]['lastUpdated']
        });
      }
      debugPrint('The process is completed $note');
      return note;
    }
    debugPrint('There is an error');
    return []; 
  }
  
  // close the database
  Future closeDB() async {
    final db = await instance.database;
    db.close();
  }

}