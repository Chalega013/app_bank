import 'package:flutter_application_1/estrutura_de_dados/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, "main.db");

    return await openDatabase(dbPath, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE users (id INTEGER PRIMARY KEY, cpf TEXT UNIQUE, senha TEXT)",
    );
  }

  Future<int?> addUser(User user) async {
    final db = await this.db;
    return await db?.insert("users", user.toMap());
  }

  Future<User?> getUser(int id) async {
    final db = await this.db;
    final maps = await db!.query(
      "users",
      columns: User.columns,
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> deleteUser(int id) async {
    final db = await this.db;
    return await db!.delete("users", where: "id = ?", whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    final db = await this.db;
    return await db!.update(
      "users",
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
  }

  Future<List<User>> getAllUsers() async {
    final db = await this.db;
    final maps = await db!.query("users", columns: User.columns);

    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<bool> validateUser(String cpf, String senha) async {
    cpf = cpf.replaceAll(RegExp(r'\D'), ''); // Normaliza o CPF para apenas dígitos
    final db = await this.db;
    final maps = await db!.query(
      "users",
      where: "cpf = ? AND senha = ?",
      whereArgs: [cpf, senha],
    );

    print("Resultado da consulta: ${maps.isNotEmpty}");
    return maps.isNotEmpty;
  }

  getUserByCpf(String cpf) {}
}
