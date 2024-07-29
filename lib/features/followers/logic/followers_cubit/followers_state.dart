part of 'followers_cubit.dart';

@immutable
sealed class FollowersState {}

final class FollowersInitialState extends FollowersState {}
final class FollowersLoadingState extends FollowersState {}
final class FollowersSuccessState extends FollowersState {
  final List<dynamic> followers;
  FollowersSuccessState({required this.followers});
}
final class FollowersFailureState extends FollowersState {
  final String failureMsg;
  FollowersFailureState({required this.failureMsg});
}

