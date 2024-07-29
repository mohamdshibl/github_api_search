import 'package:dartz/dartz.dart';
import 'package:task_one/core/errors/failures.dart';

import '../../model/followers.dart';

abstract class FetchFollowersRepo {

  Future<Either<Failure,List<Followers>>> fetchUserFollowers ();

}