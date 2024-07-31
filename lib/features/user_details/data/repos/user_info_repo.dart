import 'package:dartz/dartz.dart';
import 'package:task_one/core/errors/failures.dart';


import '../../presentation/uesr_details.dart';
import '../data_source/user_info_remote_data_source.dart';



abstract class UserInfoRepo {
  Future<Either<Failure, List<UserDetails>>> fetchUserInfoFromDataSource(String username);
}

class UserInfoRepoImpl implements UserInfoRepo {
  final FetchUserInfoDataSource userInfoDataSource;

  UserInfoRepoImpl(this.userInfoDataSource);

  @override
  Future<Either<Failure, List<UserDetails>>> fetchUserInfoFromDataSource(String username) async {
    try {
      final List<dynamic> response = await userInfoDataSource.fetchUserInfo(username);
      List<UserDetails> userDetails = response.map((item) => UserDetails.fromJson(item)).toList();

      return right(userDetails);
    }
    catch (e) {
      return left(ServerFailure());
    }
  }
}





























// List<UserDetails> userDetails = response.where((item) => item is Map<String, dynamic>) // Ensure item is a Map for fromJson
//     .map((item) => UserDetails.fromJson(item as Map<String, dynamic>))
//     .toList();