import 'package:get_it/get_it.dart';
import 'package:task_one/core/constants/api_url.dart';
import 'package:task_one/core/networks/web_service.dart';

import '../data/data_source/user_info_remote_data_source.dart';
import '../data/repos/user_info_repo.dart';
import '../logic/user_details_cubit/user_details_cubit.dart';



GetIt sl = GetIt.instance;

void init(){
  // Register WebService first
  sl.registerLazySingleton<WebService>(() => WebServiceWithDioImpl(
    baseUrl: baseUrl,
    headers: {'accept': 'application/vnd.github+json'},
  ));

  // Register FetchFollowersDataSource with the required WebService
  sl.registerLazySingleton<FetchUserInfoDataSource>(
        () => FetchUserInfoDataSourceImpl(sl<WebService>()),
  );

  // Register FetchFollowersRepo
  sl.registerLazySingleton<UserInfoRepo>(
        () => UserInfoRepoImpl(sl<FetchUserInfoDataSource>()),
  );

  // Register FollowersCubit
  sl.registerLazySingleton(
        () => UserDetailsCubit(userInfoRepo: sl<UserInfoRepo>()),
  );

}
