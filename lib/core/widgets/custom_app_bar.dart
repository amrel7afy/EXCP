import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? leading;

  const CustomAppBar({super.key, required this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      leading: leading!=null?IconButton(icon: const Icon(Icons.menu), onPressed: () {}):null,
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {})
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(89.h);
}
