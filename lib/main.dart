import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/di/locator.dart';
import 'package:test1/core/helper/cache_helper.dart';

import 'app.dart';
import 'core/shared/bloc_observer.dart';
import 'features/login/data/models/login_success_models/user.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = MyBlocObserver();
  String initialRoute= await AppRouter.getInitialRouteFromSharedPreferences();



  runApp( MyApp(initialRoute: initialRoute));
  //log('');
}
