import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/helper/cache_helper.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_cubit.dart';
import 'package:test1/features/login/presentation/view/login_view.dart';

import 'core/shared/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer=MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(375,812),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (BuildContext context)=>AuthCubit(),
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: 'Alexandria',
            ),
           home: const LoginView(),

          ),
        ),
      ),
    );



  }
}

TextDirection appTextDirection=TextDirection.rtl;
String usersListKey='';