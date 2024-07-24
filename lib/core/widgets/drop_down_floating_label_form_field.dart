import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';

import '../constants/constants.dart';

class MyDropdownFormField<T> extends StatelessWidget {
  final String labelText;
  final List<T> items;
  final T? value;
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
    this.searchHintText = 'ابحث...',
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Padding(
        padding: EdgeInsets.only(bottom: padding ?? 15.0),
        child: GestureDetector(
          onTap: () => _showSearchableDialog(context),
          child: AbsorbPointer(
            child: DropdownButtonFormField<T>(
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

  void _showSearchableDialog(BuildContext context) {
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

class SearchableDropdownDialog<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final void Function(T?) onChanged;
  final String searchHintText;

  const SearchableDropdownDialog({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onChanged,
    this.searchHintText = 'Search...',
  });

  @override
  _SearchableDropdownDialogState<T> createState() =>
      _SearchableDropdownDialogState<T>();
}

class _SearchableDropdownDialogState<T>
    extends State<SearchableDropdownDialog<T>> {
  late List<T> filteredItems;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterItems);
    searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    setState(() {
      filteredItems = widget.items
          .where((item) => widget
              .itemBuilder(item)
              .toString()
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: AlertDialog(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(20)),
            hintText: widget.searchHintText,
            prefixIcon: const Icon(Icons.search),
          ),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              final item = filteredItems[index];
              return ListTile(
                title: widget.itemBuilder(item),
                onTap: () {
                  widget.onChanged(item);
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
