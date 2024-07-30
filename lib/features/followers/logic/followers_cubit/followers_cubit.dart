import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_one/features/followers/data/repos/fetch_followers_repo.dart';

import '../../model/followers.dart';

part 'followers_state.dart';

class FollowersCubit extends Cubit<FollowersState> {
  final FetchFollowersRepo fetchFollowersRepo;
  FollowersCubit({required this.fetchFollowersRepo}) : super(FollowersInitialState());
static FollowersCubit get(context) => BlocProvider.of(context);


  void getFollowers () async {
    emit(FollowersLoadingState());
  final either =
    await fetchFollowersRepo.fetchUserFollowersFromDataSource() ;
  either.fold(
        (failure){
    emit(FollowersFailureState(failureMsg: failure.failMsg));
    print(failure.failMsg);
        },
        (followers) {
      print(followers[0].id);
      print('suuuuuuuuuuuuucs');
      emit(FollowersSuccessState(followers: followers));}
  );
  }

  }

