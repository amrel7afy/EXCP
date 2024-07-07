import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/main.dart';

showAlertDialog(BuildContext context, Widget content) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection:AppConstants. appTextDirection,
        child: AlertDialog(
          title: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -40.h,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
              content,
            ],
          ),
        ),
      );
    },
  );
}
