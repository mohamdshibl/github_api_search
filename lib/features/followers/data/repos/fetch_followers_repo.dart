import 'package:dartz/dartz.dart';
import 'package:task_one/core/errors/failures.dart';

import '../../model/followers.dart';
import '../data_source/remote_data_source.dart';

abstract class FetchFollowersRepo {
  Future<Either<Failure,List<Followers>>> fetchUserFollowersFromDataSource();
}

class FetchFollowersRepoImpl implements FetchFollowersRepo {
  final FetchFollowersDataSource fetchFollowersDataSource;

  FetchFollowersRepoImpl(this.fetchFollowersDataSource);

  @override
  Future<Either<Failure,List<Followers>>> fetchUserFollowersFromDataSource() async {
    try {
      final response = await fetchFollowersDataSource.fetchFollowers();
      print('repo');
      print(response);
      return right(response);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}

// abstract class FetchFollowersRepo {
//   Future<Either<Failure, List<Followers>>> fetchUserFollowersFromDataSource();
// }
//
// class FetchFollowersRepoImpl implements FetchFollowersRepo {
//   final FetchFollowersDataSource fetchFollowersDataSource;
//
//   FetchFollowersRepoImpl(this.fetchFollowersDataSource);
//
//   @override
//   Future<Either<Failure, List<Followers>>> fetchUserFollowersFromDataSource() async {
//     try {
//       final response = await fetchFollowersDataSource.fetchFollowers(); // Call method with parentheses
//
//       // Print the raw response to understand its structure
//       print('Raw response: $response');
//
//       // Check if response is a List and map to Followers
//       if (response is List) {
//         List<Followers> followersList = response
//             .map((json) => Followers.fromJson(json))
//             .toList();
//
//         // Print the followers list to verify correctness
//         print('Followers list: $followersList');
//
//         return right(followersList);
//       } else {
//         // Handle unexpected response format
//         print('Unexpected response format: $response');
//         return left(ServerFailure());
//       }
//     } catch (e, stacktrace) {
//       // Print error details for debugging
//       print('Error: $e');
//       print('Stacktrace: $stacktrace');
//
//       return left(ServerFailure());
//     }
//   }
// }