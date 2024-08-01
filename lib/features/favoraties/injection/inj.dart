import 'package:get_it/get_it.dart';
import 'package:task_one/core/data_base/sql_db.dart';
import '../data/local_data_source/user_info_local_data_source.dart';
import '../data/repo/favorite_repo.dart';
import '../logic/cubit/favorite_cubit.dart';


GetIt sd = GetIt.instance;

void initSd(){


  // Register FetchFollowersDataSource with the required WebService
  sd.registerLazySingleton<DbHelper>(() => DbHelper(),);

  // Register FetchFollowersRepo
  sd.registerLazySingleton<UserFavoriteRepo>(
        () => UserFavoriteRepoImpl(sd<DbHelper>()),
  );

  // Register FollowersCubit
  sd.registerLazySingleton(
        () => FavoriteCubit(userFavoriteRepo: sd<UserFavoriteRepo>()),
  );
  // sd.registerFactory(
  //       () => FavoriteCubit(userFavoriteRepo: null),
  // );

}
