import 'package:get_it/get_it.dart';
import '../logic/cubit/favorite_cubit.dart';


GetIt sd = GetIt.instance;

void initSd(){



  sd.registerFactory(
        () => FavoriteCubit(),
  );

}
