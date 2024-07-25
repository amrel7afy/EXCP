import 'package:flutter/material.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/helper/cache_helper.dart';
import 'package:test1/core/helper/extensions.dart';

import '../../../core/constants/vertical_and_horizontal_space.dart';
import '../../../core/theming/my_colors.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('القائمة الرئيسية'),
          ),
          ListTile(
            title: const Text('الصفحة الرئيسية'),
            onTap: () {
              // Add your onTap logic here
            },
          ),
          ListTile(
            title: const Text('صفحة أخرى'),
            onTap: () {
              // Add your onTap logic here
            },
          ),ListTile(
            title: const Row(
              children: [
                Icon(Icons.logout,color: MyColors.kPrimaryColor,),
                HorizontalSpacer(5),
                Text('تسجيل الخروج'),

              ],
            ),
            onTap: () {
              SharedPrefHelper.clearAllSecuredData();
              context.pushNamedAndRemoveUntil(AppRouter.loginView, predicate: (predicate)=>true);
            },
          ),
        ],
      ),
    );
  }
}