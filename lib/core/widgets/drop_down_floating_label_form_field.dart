import 'package:flutter/material.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import '../../components/search_alert_dialog.dart';
import '../constants/constants.dart';

class MyDropdownFormField<T> extends StatelessWidget {
  final String labelText;
  final List<T> items;
  final T? value;
  final String? hint;
  final void Function(T?) onChanged;
  final Widget Function(T) itemBuilder;
  final double? padding;
  final String? Function(T?)? validator;
  final String searchHintText;

  const MyDropdownFormField({
    super.key,
    required this.labelText,
    required this.items,
    this.value,
    required this.onChanged,
    required this.itemBuilder,
    this.padding,
    required this.validator,
    this.searchHintText = 'ابحث...', this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Padding(
        padding: EdgeInsets.only(bottom: padding ?? 15.0),
        child: GestureDetector(
          onTap: () => showSearchableDialog(context),
          child: AbsorbPointer(
            child: DropdownButtonFormField<T>(
              hint: hint != null ? Text(hint!) : null,
              style: MyTextStyles.font15Weight600
                  .copyWith(color: MyColors.kPrimaryColor),
              value: value,
              icon: const Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: MyColors.kPrimaryColor,
              ),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: labelText,
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: Colors.red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: Colors.black),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
              onChanged: onChanged,
              items: items.map((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: itemBuilder(item),
                  ),
                );
              }).toList(),
              validator: validator,
            ),
          ),
        ),
      ),
    );
  }

  void showSearchableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Container();
      },
    );
  }
}
