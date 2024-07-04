import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/shared/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer=MyBlocObserver();

  runApp(const MyApp( ));
  //log('');
}



TextDirection appTextDirection=TextDirection.rtl;
String usersListKey='';