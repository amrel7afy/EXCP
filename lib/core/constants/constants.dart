//--------------- Routing -----------------


import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

const Duration kTransitionDurationVal=Duration(milliseconds: 1300);
const Duration kSlidingDurationVal= Duration(milliseconds: 900);
const Duration kNavigationDurationVal= Duration(milliseconds: 1300);

 double kAppDefaultPadding=24.0.w;

const double k8Padding=10.0;
const double kLeftHomeViewPadding=10.0;
const double kLeftBookDetailsViewPadding=30.0;
const double kRightBookDetailsViewPadding=30.0;

const double cardBorderRadius=10.0;


const kGTSectraFine='GT Sectra Fine';

abstract class AppConstants{
 static const isLoggedInKey='isSignedInKey';
 static const isOnBoardingKey='isOnBoardingKey';
 static const userToken='';
 static const double k8Radius=8.0;
 static  TextDirection appTextDirection=TextDirection.rtl;
 static const String usersListKey='';


 static const double k8Padding=10.0;
 static  double k30HomeViewPadding=30.0.w;

}
