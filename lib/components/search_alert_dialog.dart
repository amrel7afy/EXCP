import 'package:flutter/material.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';

import '../core/constants/constants.dart';





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