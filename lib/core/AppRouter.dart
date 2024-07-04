import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/home/presentation/view/home_view.dart';

import '../features/login/presentation/view/login_view.dart';
import '../features/service_per_hour/presentation/view/service_per_hour_view.dart';
import '../features/sign_up/presentation/view/sign_up_view.dart';
import 'constants/constants.dart';

import 'helper/cache_helper.dart';

class AppRouter {
  //

  static Future<String> getInitialRouteFromSharedPreferences() async {
    String userToken =
        await SharedPrefHelper.getSecuredString(AppConstants.userToken) ??
            false;
    log('$userToken userToken');
    bool isOnBoarded =
        await SharedPrefHelper.getBool(AppConstants.isOnBoardingKey) ?? false;
    log('$isOnBoarded isOnBoarded');
    if (!userToken.isNullOrEmpty()) {
      return homeView; // User is logged in, navigate to chatPage
    } else if (isOnBoarded) {
      return loginView; // User hasn't logged in but completed onboarding
    } else {
      return onBoardingView; // User hasn't completed onboarding
    }
  }

  static const String homeView = '/homeView';
  static const String onBoardingView = '/onBoardingView';
  static const String loginView = '/LoginView';
  static const String searchView = '/searchView';
  static const String singUpView = '/singUpView';
  static const String servicePerHourView = '/servicePerHourView';

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case servicePerHourView:
        return MaterialPageRoute(
          builder: (context) =>
          const ServicePerHourView(),
        );
      case homeView:
        return MaterialPageRoute(
          builder: (context) =>
          const HomeView(),
        );
      case loginView:
        return MaterialPageRoute(
          builder: (context) =>
          const LoginView(),
        );
      case singUpView:
        return MaterialPageRoute(
          builder: (context) =>
          const SignUpView(),
        );

        return null;
    }
    return null;
  }


}