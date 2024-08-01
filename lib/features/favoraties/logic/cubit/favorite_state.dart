part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}


final class ChangeFavoriteBtmState extends FavoriteState {
 // ChangeFavoriteBtmState(bool isFavorite);
}
final class FavoriteUserLoadingState extends FavoriteState {}
final class FavoriteUserSuccessState extends FavoriteState {
  final  userInfo;
  FavoriteUserSuccessState({required this.userInfo});
}


final class FavoriteUserFailureState extends FavoriteState {
  final String failureMsg;
  FavoriteUserFailureState( {required this.failureMsg});
}

final class FavoriteUserDeletedSuccessState extends FavoriteState {

  final bool isDeleted;
  FavoriteUserDeletedSuccessState({required this.isDeleted});
}