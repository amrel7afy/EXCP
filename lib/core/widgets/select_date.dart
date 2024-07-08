import 'package:flutter/material.dart';

import '../theming/my_colors.dart';

Future<String> selectDate(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: MyColors.kPrimaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  //foregroundColor: Colors.red,
                  ),
            ),
          ),
          child: child!);
    },
  );
  String formattedDate = '';
  if (picked != null && picked != DateTime.now()) {
    // Format the date as 'yyyy-MM-dd'
     formattedDate =
        "${picked.year}/${picked.month.toString()}/${picked.day.toString()}";
  }
  return formattedDate.isNotEmpty?formattedDate:'No Date';
}
