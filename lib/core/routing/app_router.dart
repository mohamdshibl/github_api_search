

import 'package:flutter/material.dart';
import 'package:task_one/core/routing/routes.dart';

import '../../features/favoraties/presentation/favorate/favorate_screen.dart';
import '../../features/followers/presentation/followers_list/followers_result.dart';
import '../../features/user_details/presentation/uesr_details.dart';
import '../../layout/app_layout.dart';
//
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (_) => const AppLayout(),
        );
      case Routes.followersScreen:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => FollowersResult(userName: args),
          );
        }
        return _errorRoute(settings.name);
      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => const FavoriteScreen(),
        );
      case Routes.userDetailsScreen:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => UserDetails(userName: args),
          );
        }
        return _errorRoute(settings.name);
      default:
        return _errorRoute(settings.name);
    }
  }

  Route _errorRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for $routeName'),
        ),
      ),
    );
  }
}