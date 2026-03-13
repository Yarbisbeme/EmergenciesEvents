
import 'package:emergenciesevents/model/emergency_event.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Yarbis Beltre mercedes
//20220907

class DatabaseHelper {

  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  static const table = 'Events';

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('emergencies_v');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final db = await getDatabasesPath();
    final path = join(db, fileName);
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    return db.execute('''
      CREATE TABLE $table(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL,
        imagePath TEXT NOT NULL
      )
    ''');
  }

  // CRUD

  // Insert rec in DATABASE
  Future<int> insert(EmergencyEvent values) async {
    final db = await instance.database;
    return await db.insert(table, values.toMap());
  }

  // Get ALL the items
  Future<List<EmergencyEvent>> getAll() async {
    final db = await instance.database;
    final result = await db.query(table, orderBy: 'id DESC');
    return result.map((json) => EmergencyEvent.fromMap(json)).toList();
  }


}