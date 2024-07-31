import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/features/followers/data/repos/fetch_followers_repo.dart';
import 'package:task_one/features/followers/model/followers.dart';

part 'followers_state.dart';

class FollowersCubit extends Cubit<FollowersState> {
  final FetchFollowersRepo fetchFollowersRepo;
  FollowersCubit({required this.fetchFollowersRepo}) : super(FollowersInitialState());
static FollowersCubit get(context) => BlocProvider.of(context);

List<Followers> followersList = [];
  void getFollowers (String username,{int pages = 0}) async {
    print(username);
    emit(FollowersLoadingState());
  final either =
    await fetchFollowersRepo.fetchUserFollowersFromDataSource( username, pages: pages) ;
  either.fold(
        (failure){
    emit(FollowersFailureState(failureMsg: failure.failMsg));
    print(failure.failMsg);
        },
        (followers) {
          followersList = followers;
      print(followers[0].id);
      emit(FollowersSuccessState(followers: followers));}
  );
  }



  // filter followers

  List<Followers> searchList = [];
  void searchJobs(String query) {
    if (query==""){
      searchList=[];
      emit(DeleteUserSearchState());
    }else{
      followersList =  searchList.where((job) =>
          job.login!.toLowerCase().contains(query.toLowerCase())).toList();
      emit(SearchUserState());
    }
  }


  void filterUsers(String filter) {
    if (state is FollowersLoadingState) {
      final currentState = state as FollowersLoadingState;

      if (filter.isEmpty) {
        emit(FollowersLoadingState(
            // followers: followersList,
            // hasReachedMax: currentState.hasReachedMax
        ));
      } else {
        final filteredUsers = followersList
            .where((follower) => follower.login!.toLowerCase().contains(filter.toLowerCase()))
            .toList();
        emit(FollowersLoadingState(
            // followers: filteredUsers,
            // hasReachedMax: currentState.hasReachedMax
        ));
      }
    }
  }
  }

