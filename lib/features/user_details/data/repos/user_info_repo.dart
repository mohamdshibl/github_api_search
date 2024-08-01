import 'package:dartz/dartz.dart';
import 'package:task_one/core/errors/failures.dart';


import '../data_source/user_info_remote_data_source.dart';
import '../model/user_model/user.dart';



abstract class UserInfoRepo {
  Future<Either<Failure, UserInfo>> fetchUserInfoFromDataSource(String username);
}

class UserInfoRepoImpl implements UserInfoRepo {
  final FetchUserInfoDataSource userInfoDataSource;

  UserInfoRepoImpl(this.userInfoDataSource);

  @override
  Future<Either<Failure, UserInfo>> fetchUserInfoFromDataSource(String username) async {
    try {
      final response = (await userInfoDataSource.fetchUserInfo(username)) ;
      return right(UserInfo.fromJson(response));
    }
    catch (e) {
      return left(ServerFailure());
    }
  }
}





























// List<UserDetails> userDetails = response.where((item) => item is Map<String, dynamic>) // Ensure item is a Map for fromJson
//     .map((item) => UserDetails.fromJson(item as Map<String, dynamic>))
//     .toList();