/*import 'dart:io';
import 'dart:async';
import 'package:color_palette0/palette.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';




class DatabaseHelp{

  DatabaseHelp._();
  static  DatabaseHelp bd = DatabaseHelp._();
  Database _bd;

  Future<Database> get database async {
    if (_bd != null) {
      return _bd;
    }
    _bd = await initDB();
    return _bd;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'favorites.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database bd, int version) async {
          await bd.execute('''CREATE TABLE favorites(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      size INTEGER,
      colors TEXT,)''');
        });
  }

  Future<int> addToDatabase(Palette p) async {
    final db = await database;
    var a = db.insert('favorites', p.toMap());
    return a;
  }
  Future<List<Note>> getAllNotes() async {
    final db = await database;
    var response = await db.query('mytab');
    List<Note> list = response.isNotEmpty
        ? response.map((e) => Note.fromMap(e)).toList()
        : [];
    return list;
  }
  Future<int> removeFromDatabase(int id) async {
    final db = await database;
    var a = db.delete('mytab', where: 'id = ?', whereArgs: [id]);
    return a;
  }

  Future<Note> getNoteById(int id) async {
    final db = await database;
    var response = await db.query('mytab', where: 'id = ?', whereArgs: [id]);
    return response.isNotEmpty ? Note.fromMap(response.first) : null;
  }
  Future<int> updateNote(Note note) async {
    final db = await database;
    var response =
    db.update('mytab', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
    print(note.content);
    return response;
  }

}


 */