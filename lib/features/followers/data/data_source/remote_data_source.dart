import '../../model/followers.dart';

abstract class FetchFollowersDataSource {
  Future<List<Followers>> fetchFollowers();
}

