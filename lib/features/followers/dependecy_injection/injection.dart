import 'package:get_it/get_it.dart';
import 'package:task_one/core/constants/api_url.dart';
import 'package:task_one/core/networks/web_service.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/repos/fetch_followers_repo.dart';
import '../logic/followers_cubit/followers_cubit.dart';

GetIt sl = GetIt.instance;

void initSl(){
  // Register WebService first
  sl.registerLazySingleton<WebService>(() => WebServiceWithDioImpl(
    baseUrl: baseUrl,
    headers: {'accept': 'application/vnd.github+json'},
  ));

  // Register FetchFollowersDataSource with the required WebService
  sl.registerLazySingleton<FetchFollowersDataSource>(
        () => FetchFollowersDataSourceImpl(sl<WebService>()),
  );

  // Register FetchFollowersRepo
  sl.registerLazySingleton<FetchFollowersRepo>(
        () => FetchFollowersRepoImpl(sl<FetchFollowersDataSource>()),
  );

  // Register FollowersCubit
  sl.registerFactory(
        () => FollowersCubit(fetchFollowersRepo: sl<FetchFollowersRepo>()),
  );

}
