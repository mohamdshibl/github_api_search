import '../../../../../core/data_base/sql_db.dart';
import '../../../user_details/data/model/user_model/user.dart';
import '../model/userState.dart';

class DbHelper extends SqlDb {
  DbHelper(param0);


  Future<List<UserInfo>> getAllPerson() async {
    List<UserInfo> users = [];
    String sql = "SELECT * FROM Favorite";
    List<dynamic> myMap = await inquiry(sql);
    for (var map in myMap) {
      users.add(UserInfo.fromJson(map));
    }
    return users;
  }

  Future<int> insertNewPerson(UserInfo user) async {
    String sql = '''
      INSERT INTO Favorite(name, avatarUrl, favorite)
      VALUES ('${user.name}', '${user.avatarUrl}', ${user.favorite ? 1 : 0})
    ''';
    return await insert(sql);
  }

  Future<int> updatePerson(UserInfo user) async {
    String sql = '''
      UPDATE Favorite SET
      name = '${user.name}',
      avatarUrl = '${user.avatarUrl}',
      favorite = ${user.favorite ? 1 : 0}
      WHERE id = ${user.id}
    ''';
    return await update(sql);
  }

  Future<int> deletePerson(UserInfo user) async {
    String sql = '''
      DELETE FROM Favorite
      WHERE id = ${user.id}
    ''';
    return await delete(sql);
  }
}
