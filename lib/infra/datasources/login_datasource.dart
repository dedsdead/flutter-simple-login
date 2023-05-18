import 'package:login_sqlite/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class LoginDataSource {
  Future<Database> get databaseInstance;
  Future<UserModel> login(String login, String senha);
  Future<void> createUser(UserModel user);
}
