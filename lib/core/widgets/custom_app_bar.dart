import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/helper/extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? leading;
  final VoidCallback? leadingPressed;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.leading,
       this.leadingPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      leading: leading != null
          ? IconButton(icon: const Icon(Icons.menu), onPressed: () {})
          : IconButton(
              onPressed: leading == null
                  ? () {
                      context.pop();
                    }
                  : leadingPressed,
              icon: Icon(Icons.arrow_back)),
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {})
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(89.h);
}
