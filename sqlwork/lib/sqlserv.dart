// ignore_for_file: prefer_const_declarations, unnecessary_string_interpolations

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlwork/models/user.dart';

class SQLiteService {
  late Future<Database> _db;
  SQLiteService() {
    _initDB();
  }

  void _initDB() async {
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final tType = "TEXT NOT NULL";
    _db = openDatabase(join(await getDatabasesPath(), "users.db"),
        onCreate: ((db, version) {
      db.execute(
          "CREATE TABLE users (${UserFields.id} $idType,${UserFields.username} $tType, ${UserFields.password} $tType)");
    }), version: 1);
  }

  Future<User> createUser(User user) async {
    Database db = await _db;

    final id = await db.insert("users", user.toJson());
    return user.copy(id: id);
  }

  Future<User?> readForUser(int id) async {
    Database db = await _db;
    final info = await db.query("users",
        columns: UserFields.columns,
        where: "${UserFields.id} = ?",
        whereArgs: [id]);
    if (info.isNotEmpty) {
      return User.fromJson(info.first);
    } else {
      return null;
    }
  }

  Future<List<User>> readAll() async {
    Database db = await _db;
    final info = await db.query("users", orderBy: "${UserFields.id} ASC");

    return info.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User user) async {
    Database db = await _db;
    return await db.update("users", user.toJson(),
        where: "${UserFields.id} = ?", whereArgs: [user.id]);
  }

  Future<int> delete(int id) async {
    Database db = await _db;
    return await db
        .delete("users", where: "${UserFields.id} = ?", whereArgs: [id]);
  }

  Future createorReplace(User user) async {
    Database db = await _db;
    await db.rawQuery(
        "INSERT OR REPLACE INTO users(id,username,password) VALUES (id, $user.id), (username, $user.username), ($user.password);");
  }

  Future changeName() async {
    Database db = await _db;
    await db.rawQuery("ALTER TABLE users RENAME TO usersunited;");
  }

  Future addCol(String col) async {
    Database db = await _db;
    await db.rawQuery("ALTER TABLE users ADD COLUMN $col ;");
  }

  Future updatePassword(String pass) async {
    Database db = await _db;
    await db.rawQuery(
        "SELECT CASE password WHEN ${""} THEN no password ELSE $pass FROM users;");
  }
}
