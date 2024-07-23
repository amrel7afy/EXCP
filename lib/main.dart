import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/di/locator.dart';
import 'package:test1/features/sign_up/presentation/sign_up_view_model.dart';
import 'package:test1/utility/repository/repository.dart';
import 'app.dart';
import 'controller/hourly_contract/hourly_contract_controller.dart';
import 'core/shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = MyBlocObserver();

await Repository.getUser();
  String initialRoute= await AppRouter.getInitialRouteFromSharedPreferences();
  runApp( MyApp(initialRoute: initialRoute));
}
