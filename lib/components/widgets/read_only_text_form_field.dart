import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/design_your_plan/presentation/design_your_plan_view_model.dart';

import '../../../core/constants/constants.dart';
import '../../components/search_alert_dialog.dart';
import '../../core/theming/styles.dart';

class ReadOnlyDropdownFormField<T> extends StatefulWidget {
  final String labelText;
  String? text;
  final GenericCubit<String> cubit;
  final double? padding;
  final String hint;
  final TextStyle? hintStyle;
  final String? Function(String? value) validator;
  final List<String> items;

  final String searchHintText;

  ReadOnlyDropdownFormField({
    super.key,
    required this.labelText,
    this.padding,
    required this.validator,
    required this.hint,
    this.hintStyle,
    required this.items,
    this.searchHintText = 'ابحث...',
    this.text,
    required this.cubit,
  });

  @override
  _ReadOnlyDropdownFormFieldState<T> createState() =>
      _ReadOnlyDropdownFormFieldState<T>();
}

class _ReadOnlyDropdownFormFieldState<T>
    extends State<ReadOnlyDropdownFormField<T>> {


  DesignYourPlanViewModel designYourPlanViewModel =
      DesignYourPlanViewModel.instance();
  String? errorText;
@override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<String>, GenericState<String>>(
      bloc: widget.cubit,
      builder: (context, state) {
        String? selected;
        if (state is GenericUpdate) {
          selected = state.data??widget.hint;
        }
        return Directionality(
          textDirection: AppConstants.appTextDirection,
          child: Padding(
            padding: EdgeInsets.only(bottom: widget.padding ?? 15.0),
            child: GestureDetector(
              onTap: () => showSearchableDialog(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selected.isNullOrEmpty()? widget.hint:selected!),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: 10,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 7, right: 7),
                          child: Text(
                            widget.labelText,
                            style: MyTextStyles.font14Weight500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (errorText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        errorText!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showSearchableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SearchableDropdownDialog<T>(
          searchCubit: widget.cubit,
          items: widget.items,
          onChanged: (value) {
            widget.text = value.toString();
            setState(() {
              errorText = widget.validator(widget.text);
            });
          },
          searchHintText: widget.searchHintText,
        );
      },
    );
  }
}
