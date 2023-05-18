abstract class UserTableSchema {
  static const nameTable = 'user';
  static const userIdColumn = 'id';
  static const userNameColumn = 'user';
  static const userEmailColumn = 'email';
  static const userPasswordColumn = 'password';

  static String createUserTableScript() => '''
  CREATE TABLE $nameTable (
    $userIdColumn TEXT NOT NULL PRIMARY KEY,
    $userNameColumn TEXT NOT NULL,
    $userEmailColumn TEXT NOT NULL,
    $userPasswordColumn TEXT NOT NULL
  )
  ''';
}
