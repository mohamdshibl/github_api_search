part of 'user_details_cubit.dart';

@immutable
sealed class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}
final class UserDetailsLoadingState extends UserDetailsState {}
final class UserDetailsSuccessState extends UserDetailsState {
  final  userInfo;
  UserDetailsSuccessState({required this.userInfo});
}
final class UserDetailsFailureState extends UserDetailsState {
  final String failureMsg;
  UserDetailsFailureState({required this.failureMsg});
}

