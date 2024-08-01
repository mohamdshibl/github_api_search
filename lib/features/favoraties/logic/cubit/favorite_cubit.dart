import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../user_details/data/model/user_model/user.dart';
import '../../data/repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final UserFavoriteRepo userFavoriteRepo ;

  FavoriteCubit({required this.userFavoriteRepo}) : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  bool isFavorite = false;
  void favoriteBtmToggle() {
    isFavorite =!isFavorite;
    emit(ChangeFavoriteBtmState());

  }



  void getFavoriteUsers () async {
  emit(FavoriteUserLoadingState());
    final either = await userFavoriteRepo.fetchFavoriteUsersFromDatasource() ;
    either.fold(
            (failure){
          emit(FavoriteUserFailureState(failureMsg: failure.failMsg));
        },
            (userInfo) {
          emit(FavoriteUserSuccessState(userInfo: userInfo));}
    );
  }

  Future<void> insertFavoriteUser(UserInfo user) async {
    emit(FavoriteUserLoadingState()); // Emit loading state

    final Either<Failure, List<UserInfo>> result = await userFavoriteRepo.insertFavoriteUsersFromDatasource(user);

    result.fold(
          (failure) {
        emit(FavoriteUserFailureState(failureMsg: failure.failMsg));
      },
          (users) {
        emit(FavoriteUserSuccessState(userInfo: users));
      },
    );
  }

  // Future<void> deleteFavoriteUser(UserInfo user) async {
  //   emit(FavoriteUserLoadingState()); // Emit loading state
  //
  //   try {
  //     // Perform the delete operation
  //     final int result = await deletePerson(user);
  //
  //     // Check if the deletion was successful (assuming that a non-zero result means success)
  //     if (result > 0) {
  //       emit(FavoriteUserSuccessState(userInfo: [])); // No specific user info to return, so empty list
  //     } else {
  //       emit(FavoriteUserFailureState(failureMsg: 'No user found with the given ID.'));
  //     }
  //   } catch (e) {
  //     // Handle any exceptions that might occur
  //     emit(FavoriteUserFailureState(failureMsg: 'An error occurred: ${e.toString()}'));
  //   }
  // }

  Future<void> deleteFavoriteUser(UserInfo user) async {
    emit(FavoriteUserLoadingState()); // Emit loading state

    final Either<Failure, bool> result = await userFavoriteRepo.deleteFavoriteUserFromDatasource(user);

    result.fold(
          (failure) {
        emit(FavoriteUserFailureState(failureMsg: 'Failed to delete user: ${failure.failMsg}'));
      },
          (isDeleted) {
        emit(FavoriteUserDeletedSuccessState(isDeleted: isDeleted));
      },
    );
  }




}
