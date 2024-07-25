import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/design_your_plan/presentation/design_your_plan_view_model.dart';

import '../../../core/constants/constants.dart';
import '../../components/search_alert_dialog.dart';
import '../../core/theming/styles.dart';

class ReadOnlyDropdownFormField<T> extends StatefulWidget {
  final String labelText;
  String? text;
  final double? padding;
  final String? hint;
  final TextStyle? hintStyle;
  final String? Function(String? value) validator;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final void Function(T?) onChanged;
  final String searchHintText;

   ReadOnlyDropdownFormField({
    super.key,
    required this.labelText,
    this.padding,
    required this.validator,
    this.hint,
    this.hintStyle,
    required this.items,
    required this.itemBuilder,
    required this.onChanged,
    this.searchHintText = 'ابحث...',
    this.text,
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
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericState>(
      bloc: designYourPlanViewModel.genericCubit,
      builder: (context, state) {
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
                            color:
                                designYourPlanViewModel.nationalityCheckSelected
                                    ? Colors.black
                                    : Colors.red,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(

                              widget.text??''
                            ),
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
          items: widget.items,
          itemBuilder: widget.itemBuilder,
          onChanged: (value) {
            widget.onChanged(value);
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
