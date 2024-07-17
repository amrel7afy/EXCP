import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/di/locator.dart';
import 'app.dart';
import 'controller/steps/steps_controller.dart';
import 'core/shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = MyBlocObserver();
  String initialRoute= await AppRouter.getInitialRouteFromSharedPreferences();
  runApp( MyApp(initialRoute: initialRoute));
}
