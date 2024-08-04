import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/features/followers/data/repos/fetch_followers_repo.dart';
import 'package:task_one/features/followers/model/followers.dart';

part 'followers_state.dart';

// class FollowersCubit extends Cubit<FollowersState> {
//   final FetchFollowersRepo fetchFollowersRepo;
//   FollowersCubit({required this.fetchFollowersRepo}) : super(FollowersInitialState());
// static FollowersCubit get(context) => BlocProvider.of(context);
//
// List<Followers> followersList = [];
//   void getFollowers (String username,{int pages = 0}) async {
//     emit(FollowersLoadingState());
//   final either =
//     await fetchFollowersRepo.fetchUserFollowersFromDataSource( username, pages: pages) ;
//   either.fold(
//         (failure){
//     emit(FollowersFailureState(failureMsg: failure.failMsg));
//
//         },
//         (followers) {
//           followersList = followers;
//       print(followers[0].login);
//       emit(FollowersSuccessState(followers: followers));}
//   );
//   }

class FollowersCubit extends Cubit<FollowersState> {
  final FetchFollowersRepo fetchFollowersRepo;

  FollowersCubit({required this.fetchFollowersRepo}) : super(FollowersInitialState());

  static FollowersCubit get(BuildContext context) => BlocProvider.of<FollowersCubit>(context);

  // Internal state variables for pagination
  int _currentPage = 0;
  bool _hasMorePages = true;
  final List<Followers> _followersList = [];

  // Method to get followers
  void getFollowers(String username, {bool isInitialLoad = false}) async {
    if (isInitialLoad) {
      // Reset pagination state if this is the initial load
      _currentPage = 0;
      _hasMorePages = true;
      _followersList.clear();
    }

    if (!_hasMorePages) return; // No more pages to load

    emit(FollowersLoadingState());

    final either = await fetchFollowersRepo.fetchUserFollowersFromDataSource(username, pages: _currentPage);

    either.fold(
            (failure) {
          emit(FollowersFailureState(failureMsg: failure.failMsg));
        },
            (followers) {
          if (followers.isEmpty) {
            _hasMorePages = false;
          } else {
            _followersList.addAll(followers);
            _currentPage*10; // Increment page number by 1
          }
          emit(FollowersSuccessState(followers: _followersList));
        }
    );
  }





  // List<Followers> searchList = [];
  // void searchJobs(String query) {
  //   if (query==""){
  //     searchList=[];
  //     emit(DeleteUserSearchState());
  //   }else{
  //     _followersList =  searchList.where((job) =>
  //         job.login!.toLowerCase().contains(query.toLowerCase())).toList();
  //     emit(SearchUserState());
  //   }
  // }


  void filterUsers(String filter) {
    if (state is FollowersLoadingState) {
      final currentState = state as FollowersLoadingState;

      if (filter.isEmpty) {
        emit(FollowersLoadingState(
            // followers: followersList,
            // hasReachedMax: currentState.hasReachedMax
        ));
      } else {
        final filteredUsers = _followersList
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

