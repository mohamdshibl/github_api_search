import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/features/followers/data/repos/fetch_followers_repo.dart';

part 'followers_state.dart';

class FollowersCubit extends Cubit<FollowersState> {
  final FetchFollowersRepo fetchFollowersRepo;
  FollowersCubit({required this.fetchFollowersRepo}) : super(FollowersInitialState());
static FollowersCubit get(context) => BlocProvider.of(context);


  void getFollowers (String username,{int pages = 0}) async {
    emit(FollowersLoadingState());
  final either =
    await fetchFollowersRepo.fetchUserFollowersFromDataSource( username, pages: pages) ;
  either.fold(
        (failure){
    emit(FollowersFailureState(failureMsg: failure.failMsg));
    //print(failure.failMsg);
        },
        (followers) {
      print(followers[0].id);
      emit(FollowersSuccessState(followers: followers));}
  );
  }

  }

