import 'package:login_sqlite/external/database/user_table_schema.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqLiteDb {
  static Database? _database;
  Future<Database> get databaseInstance async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String databaseName) async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateSchema,
    );
  }

  Future<void> _onCreateSchema(Database database, int? version) async {
    await database.execute(UserTableSchema.createUserTableScript());
  }
}
