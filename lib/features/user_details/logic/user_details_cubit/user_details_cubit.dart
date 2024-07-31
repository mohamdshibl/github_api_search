import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repos/user_info_repo.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
 final UserInfoRepo userInfoRepo ;

  UserDetailsCubit({required this.userInfoRepo}) : super(UserDetailsInitial());

  static UserDetailsCubit get(context) => BlocProvider.of(context);


  void getFollowers (String username) async {
    emit(UserDetailsLoadingState());
    final either = await userInfoRepo.fetchUserInfoFromDataSource(username) ;
    either.fold(
            (failure){
          emit(UserDetailsFailureState(failureMsg: failure.failMsg));
          print(failure.failMsg);
        },
            (userInfo) {
          print(userInfo[0].login);
          emit(UserDetailsSuccessState(followers: userInfo));}
    );
  }



}
