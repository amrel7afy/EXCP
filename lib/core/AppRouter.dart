import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/di/locator.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/design_your_offer/presentation/view/design_your_offer_view.dart';
import 'package:test1/features/home/presentation/view/home_view.dart';
import 'package:test1/features/my_orders/presentation/view_model/orders_cubit/orders_cubit.dart';
import 'package:test1/features/select_address/presentation/view/select_address_view.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:test1/features/select_your_plan_hours/presentation/view/select_your_plan_view.dart';
import 'package:test1/features/select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';

import '../features/bottom_nav_bar/presentation/view/BottomNavBar.dart';
import '../features/contraction/presnetation/view/contract_info_view.dart';
import '../features/contraction/presnetation/view/contract_success_view.dart';
import '../features/contraction/presnetation/view/resident_contract_details_view.dart';
import '../features/login/presentation/view/login_view.dart';
import '../features/my_orders/presentation/view/add_new_order.dart';
import '../features/my_orders/presentation/view/my_orders_view.dart';
import '../features/resident_service/presentation/view/resident_service_view.dart';
import '../features/select_address/presentation/view/new_address_view.dart';
import '../features/select_address/presentation/view/empty_address_view.dart';
import '../features/select_your_plan_resident/presentation/view/select_your_plan_resident_view.dart';
import '../features/select_your_plan_resident/presentation/view/select_your_worker_view.dart';
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
  static const String bottomNavBar = '/bottomNavBar';
  static const String onBoardingView = '/onBoardingView';
  static const String loginView = '/LoginView';
  static const String searchView = '/searchView';
  static const String singUpView = '/singUpView';
  static const String servicePerHourView = '/servicePerHourView';
  static const String selectAddressView = '/selectAddressView';
  static const String emptyAddressView = '/emptyAddressView';
  static const String newAddressView = '/newAddressView';
  static const String selectYourPlanView = '/selectYourPlanView';
  static const String designYourOfferView = '/designYourOfferView';
  static const String contractInfoView = '/contractInfoView';
  static const String contractSuccessView = '/contractSuccessView';
  static const String myOrdersView = '/myOrdersView';
  static const String addNewOrderView = '/addNewOrderView';
  static const String selectYourPlanResidentView = '/selectYourPlanResidentView';
  static const String selectYourWorkerView = '/selectYourWorkerView';
  static const String residentContractDetailsView = '/residentContractDetailsView';




  static const String residentServiceView = '/residentServiceView';

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case residentContractDetailsView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context)=>ChooseWorkerCubit(),
              child: const ResidentContractDetailsView()),
        );
      case selectYourWorkerView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context)=>ChooseWorkerCubit(),
              child: const SelectYourWorkerView()),
        );
      case selectYourPlanResidentView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context)=>OrdersCubit(),
              child: BlocProvider(
                  create: (context)=>ChooseWorkerCubit(),
                  child: const SelectYourPlanResidentView())),
        );
      case myOrdersView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context)=>OrdersCubit(),
              child: const MyOrdersView()),
        );
      case residentServiceView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context)=>OrdersCubit(),
              child: const ResidentServiceView()),
        );
      case addNewOrderView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context)=>OrdersCubit(),
              child: const AddNewOrderView()),
        );
      case contractSuccessView:
        return MaterialPageRoute(
          builder: (context) => const ContractSuccessView(),
        );
      case contractInfoView:
        return MaterialPageRoute(
          builder: (context) => const ContractInfoView(),
        );
      case designYourOfferView:
        return MaterialPageRoute(
          builder: (context) => const DesignYourOfferView(),
        );
      case selectYourPlanView:
        return MaterialPageRoute(
          builder: (context) => const SelectYourPlanView(),
        );
      case emptyAddressView:
        return MaterialPageRoute(
          builder: (context) => const EmptyAddressView(),
        );
      case newAddressView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (BuildContext context) => locator<AddressCubit>(),
              child: const NewAddressView()),
        );
      case selectAddressView:
        return MaterialPageRoute(
          builder: (context) => const SelectAddressView(),
        );
      case servicePerHourView:
        return MaterialPageRoute(
          builder: (context) => const ServicePerHourView(),
        );
      case bottomNavBar:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case singUpView:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );

        return null;
    }
    return null;
  }
}
