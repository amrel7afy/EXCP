import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';

import '../core/constants/constants.dart';
import '../cubit/generic_cubit/generic_cubit.dart';

class SearchableDropdownDialog<T> extends StatefulWidget {
  final List<String> items;

  final String searchHintText;
  final GenericCubit<String> searchCubit;

  const SearchableDropdownDialog({
    super.key,
    required this.items,

    this.searchHintText = 'Search...',
    required this.searchCubit,
  });

  @override
  _SearchableDropdownDialogState<T> createState() =>
      _SearchableDropdownDialogState<T>();
}

class _SearchableDropdownDialogState<T>
    extends State<SearchableDropdownDialog<T>> {
  late List<String> filteredItems;
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
    filteredItems = widget.items
        .where((item) =>
            item.toLowerCase().contains(searchController.text.toLowerCase()))
        .toList();
    widget.searchCubit.update();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericState>(
      bloc: widget.searchCubit,
      builder: (context, state) {
        return Directionality(
          textDirection: AppConstants.appTextDirection,
          child: AlertDialog(
            title: widget.items.length > 10
                ? buildSearchField()
                : const VerticalSpacer(10),
            content: SizedBox(
              width: double.maxFinite,
              child: buildListView(),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView buildListView() {
    return ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    widget.searchCubit.update(item);
                    Navigator.of(context).pop();
                  },
                );
              },
            );
  }

  TextField buildSearchField() {
    return TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: widget.searchHintText,
                    prefixIcon: const Icon(Icons.search),
                  ),
                );
  }
}
