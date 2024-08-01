import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../user_details/data/model/user_model/user.dart';
import '../local_data_source/user_info_local_data_source.dart';

abstract class UserFavoriteRepo {
  Future<Either<Failure, List<UserInfo>>> fetchFavoriteUsersFromDatasource() ;
  Future<Either<Failure, List<UserInfo>>> insertFavoriteUsersFromDatasource(UserInfo user) ;
  Future<Either<Failure, bool>> deleteFavoriteUserFromDatasource(UserInfo user) ;
}

class UserFavoriteRepoImpl implements UserFavoriteRepo {
  final DbHelper dbHelper;

  UserFavoriteRepoImpl(this.dbHelper);

  @override
  Future<Either<Failure,  List<UserInfo>>> fetchFavoriteUsersFromDatasource() async {
    try {
      final response = (await dbHelper.getAllPerson()) ;
      return right(UserInfo.fromJson(response as Map<String, dynamic>) as List<UserInfo>);
    }
    catch (e) {
      return left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, List<UserInfo>>> insertFavoriteUsersFromDatasource(UserInfo user) async {
    try {
      final int result = await dbHelper.insertNewPerson(user);

      return right([user]);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavoriteUserFromDatasource(UserInfo user) async {
    try {
      final int result = await dbHelper.deletePerson(user);
      if (result > 0) {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(ServerFailure());
    }
  }


}