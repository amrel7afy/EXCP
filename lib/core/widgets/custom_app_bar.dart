import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/features/service_per_hour/presentation/view/widgets/service_per_hour_view_body.dart';
import 'package:test1/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
 final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title:  Text(title),
      leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(89.h);
}
