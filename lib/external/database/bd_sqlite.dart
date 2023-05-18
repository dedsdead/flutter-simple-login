import 'package:login_sqlite/external/database/user_table_schema.dart';
import 'package:login_sqlite/model/user_mapper.dart';
import 'package:login_sqlite/model/user_model.dart';
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

  Future<UserModel?> login(String login, String password) async {
    final database = await databaseInstance;
    var result = await database.query(
      UserTableSchema.nameTable,
      where:
          '${UserTableSchema.userIdColumn}=? AND ${UserTableSchema.userPasswordColumn}=?',
      whereArgs: [login, password],
      limit: 1,
    );

    if (result.isNotEmpty) {
      UserModel user = UserMapper.fromMapBD(result.first);
      return user;
    } else {
      return null;
    }
  }

  Future<void> createUser(UserModel user) async {
    final database = await databaseInstance;

    await database.insert(
      UserTableSchema.nameTable,
      UserMapper.toMapBD(user),
    );
  }

  Future<void> updateUser(UserModel user) async {
    final database = await databaseInstance;

    await database.update(
      UserTableSchema.nameTable,
      UserMapper.toMapBD(user),
      where: '${UserTableSchema.userIdColumn}=?',
      whereArgs: [user.userId],
    );
  }

  Future<void> deleteUser(String userId) async {
    final database = await databaseInstance;

    await database.delete(
      UserTableSchema.nameTable,
      where: '${UserTableSchema.userIdColumn}=?',
      whereArgs: [userId],
    );
  }
}
