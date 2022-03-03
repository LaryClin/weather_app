import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/models/ville.dart';

class VillesDatabase {
  static final VillesDatabase instance = VillesDatabase._init();

  static Database? _database;

  VillesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Villes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableVilles ( 
          ${VilleFields.id} $idType, 
          ${VilleFields.name} $textType,
       )
    ''');
  }

  Future<Ville> create(Ville ville) async {
    final db = await instance.database;

    final id = await db.insert(tableVilles, ville.toJson());
    return ville.copy(id: id);
  }

  Future<Ville> readVille(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableVilles,
      columns: VilleFields.values,
      where: '${VilleFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Ville.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Ville>> readAllVilles() async {
    final db = await instance.database;

    final orderBy = '${VilleFields.name} ASC';

    final result = await db.query(tableVilles, orderBy: orderBy);

    return result.map((json) => Ville.fromJson(json)).toList();
  }

  Future<int> update(Ville ville) async {
    final db = await instance.database;

    return db.update(
      tableVilles,
      ville.toJson(),
      where: '${VilleFields.id} = ?',
      whereArgs: [ville.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableVilles,
      where: '${VilleFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}