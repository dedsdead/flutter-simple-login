import 'package:login_sqlite/external/database/user_table_schema.dart';
import 'package:login_sqlite/model/user_model.dart';

abstract class UserMapper {
  static Map<String, dynamic> toMapBD(UserModel user) {
    return {
      UserTableSchema.userIdColumn: user.userId,
      UserTableSchema.userNameColumn: user.userName,
      UserTableSchema.userEmailColumn: user.userEmail,
      UserTableSchema.userPasswordColumn: user.userPassword,
    };
  }

  static UserModel fromMapBD(Map<String, dynamic> userMapFromBD) {
    return UserModel(
      userId: userMapFromBD[UserTableSchema.userIdColumn],
      userName: userMapFromBD[UserTableSchema.userNameColumn],
      userEmail: userMapFromBD[UserTableSchema.userEmailColumn],
      userPassword: userMapFromBD[UserTableSchema.userPasswordColumn],
    );
  }

  static UserModel cloneUser(UserModel user) {
    return UserModel(
      userId: user.userId,
      userName: user.userName,
      userEmail: user.userEmail,
      userPassword: user.userPassword,
    );
  }
}
