import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? disableDrawer;


  const CustomAppBar(
      {super.key,
      required this.title,
      this.disableDrawer=false,
       });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      leading: disableDrawer==true?const BackButton():null,

      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {})
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(89.h);
}
