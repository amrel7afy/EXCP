
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test1/core/AppRouter.dart';
 import 'package:test1/core/theming/my_colors.dart';

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GetMaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: MyColors.kPrimaryColor,
              fontFamily: 'Alexandria',
              appBarTheme: const AppBarTheme(
                  backgroundColor: MyColors.kAppBarBackGroundColor),
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: MyColors.kPrimaryColor,
                shape: CircleBorder(),
              )),
          //initialRoute: AppRouter.singUpView,
          initialRoute: AppRouter.homeView,
          onGenerateRoute: AppRouter().generateRoute,
        ),
      ),
    );
  }
}
