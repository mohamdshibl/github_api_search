import 'package:get_it/get_it.dart';
import '../../../core/data_base/sql_db.dart';
import '../data/local_data_source/user_info_local_data_source.dart';
import '../data/repo/favorite_repo.dart';
import '../logic/cubit/favorite_cubit.dart';


GetIt sd = GetIt.instance;

void initSd(){


  // Register FetchFollowersDataSource with the required WebService
  sd.registerLazySingleton<DbHelper>(
        () => DbHelper(sd<SqlDb>()),
  );

  // Register FetchFollowersRepo
  sd.registerLazySingleton<UserFavoriteRepo>(
        () => UserInfoRepoImpl(sd<DbHelper>()),
  );

  // Register FollowersCubit
  sd.registerFactory(
        () => FavoriteCubit(userFavoriteRepo: sd<UserFavoriteRepo>()),
  );
  // sd.registerFactory(
  //       () => FavoriteCubit(userFavoriteRepo: null),
  // );

}
