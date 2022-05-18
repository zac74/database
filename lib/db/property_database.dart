import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gam3a/model/property.dart';

class PropertyDatabase {
  static final PropertyDatabase instance = PropertyDatabase._init();

  static Database? _database;

  PropertyDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('property.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tablePropertys ( 
  ${PropertyFields.id} $idType, 
  ${PropertyFields.Title} $textType,
  ${PropertyFields.Details} $textType,
  ${PropertyFields.PhoneNumber} $integerType,
  ${PropertyFields.Location} $textType,
  ${PropertyFields.Bedroom} $integerType,
  ${PropertyFields.Bathroom} $integerType,
  ${PropertyFields.Area} $integerType,
  ${PropertyFields.Price} $integerType,

  )
''');
  }

  Future<Property> create(Property property) async {
    final db = await instance.database;

    

    final id = await db.insert(tablePropertys, property.toJson());
    return property.copy(id: id);
  }

  Future<Property> readProperty(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePropertys,
      columns: PropertyFields.values,
      where: '${PropertyFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Property.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Property>> readAllPropertys() async {
    final db = await instance.database;

    final orderBy = '${PropertyFields.Price} ASC';


    final result = await db.query(tablePropertys, orderBy: orderBy);

    return result.map((json) => Property.fromJson(json)).toList();
  }

  Future<int> update(Property property) async {
    final db = await instance.database;

    return db.update(
      tablePropertys,
      property.toJson(),
      where: '${PropertyFields.id} = ?',
      whereArgs: [property.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePropertys,
      where: '${PropertyFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
