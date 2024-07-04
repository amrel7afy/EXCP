import 'dart:developer';


import 'package:test1/core/helper/extensions.dart';

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

/*  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeView:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => locator<HomeCubit>()..emitFetchHomeData(),
              ),
              BlocProvider(
                create: (context) => locator<SpecializationCubit>()..emitFetchSpecializations(),
              ),
            ],
            child: const BottomNavBar(),
          ),
        );

    return null;
  }*/
}




