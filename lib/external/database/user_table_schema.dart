abstract class UserTableSchema {
  static const nameTable = 'user';
  static const userIdColumn = 'id';
  static const userNameColumn = 'user';
  static const userEmailColumn = 'email';
  static const userPasswordColumn = 'password';

  static String createUserTableScript() => '''
  CREATE TABLE $nameTable (
    $userIdColumn TEEXT NOT NULL PRIMARY KEY,
    $userNameColumn TEEXT NOT NULL,
    $userEmailColumn TEEXT NOT NULL,
    $userPasswordColumn TEEXT NOT NULL
  )
  ''';
}
