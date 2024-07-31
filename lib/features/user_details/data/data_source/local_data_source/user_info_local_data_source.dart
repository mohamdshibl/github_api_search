import '../../../../../core/data_base/sql_db.dart';
import '../../model/user_model/user.dart';

class DbHelper extends SqlDb {

  getAllPerson() async {
    List<UserInfo> user = [];
    String sql = "SELECT * FROM User";
    List<dynamic> myMap = await inquiry(sql);
    for(int i=0;i<myMap.length;i++){
     // user.add(user.fromJson(myMap[i]));
    }
    return user;
  }

  insertNewPerson(UserInfo user) async {

    String sql = '''
  INSERT INTO Person(name, avatarUrl)
  VALUES ('${user.name}' , '${user.avatarUrl}')
 
  ''';

    int result =await insert(sql);
    return result;
  }
  updatePerson(UserInfo user) async {

    String sql = '''
  UPDATE User SET
  name = '${user.name}',
  age = '${user.avatarUrl}'
  WHERE
  id = '${user.id}'
  ''';

    int result =await update(sql);
    return result;
  }
  deletePerson(UserInfo user) async {

    String sql = '''
   DELETE FROM User
   WHERE
   id = '${user.id}'
   ''';

    int result =await delete(sql);
    return result;
  }

}
