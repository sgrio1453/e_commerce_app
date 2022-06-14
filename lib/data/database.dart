import 'package:e_ticaret/models/kullanici.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class KulBilgiDatabase {
  static final KulBilgiDatabase instance = KulBilgiDatabase._init();

  static Database? _database;

  KulBilgiDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('kulbilgi.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableUser(
      id INTEGER PRIMARY KEY,
      ${UserFields.userName} TEXT NOT NULL,
      ${UserFields.email} TEXT NOT NULL,
      ${UserFields.uniqueId} TEXT)''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;

    final uniqueId = await db.insert(tableUser, user.toJson());
    return user.copy();
  }

  Future<User> readUser(String email) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUser,
      columns: UserFields.values,
      where: '${UserFields.email} = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $email not found');
    }
  }

  Future<List<User>> readAllUser() async {
    final db = await instance.database;

    final result = await db.query(tableUser);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User user) async {
    final db = await instance.database;

    return db.update(
      tableUser,
      user.toJson(),
      where: '${UserFields.email} = ?',
      whereArgs: [user.uniqueId],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUser,
      where: '${UserFields.email} = ?',
      whereArgs: [UserFields.uniqueId],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
