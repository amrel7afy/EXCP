import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../components/search_alert_dialog.dart';

class ReadOnlyDropdownFormField<T> extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final double? padding;
  final String? hint;
  final TextStyle? hintStyle;
  final Function(String? value) validator;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final void Function(T?) onChanged;
  final String searchHintText;

  const ReadOnlyDropdownFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.padding,
    required this.validator,
    this.hint,
    this.hintStyle,
    required this.items,
    required this.itemBuilder,
    required this.onChanged,
    this.searchHintText = 'ابحث...',
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
            child: TextFormField(
              controller: controller,
              readOnly: true, // Set readOnly property
              validator: (value) => validator(value),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: hintStyle,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                  color: Colors.black,
                ),
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
        return SearchableDropdownDialog<T>(
          items: items,
          itemBuilder: itemBuilder,
          onChanged: onChanged,
          searchHintText: searchHintText,
        );
      },
    );
  }
}
