import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/build_drop_down_menu.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import 'package:test1/features/login/presentation/view/widgets/my_text_form_field.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_state.dart';

import '../../../../../core/AppRouter.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'address_on_map_view_page.dart';

class EnterAddressDataPage extends StatelessWidget {
  const EnterAddressDataPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyDropdownFormField<String>(
                labelText: 'مدينة الإقامة',
                validator: (v) {},
                items: context.read<AddressCubit>().cityNameOptions,
                onChanged: (newVal) {
                  context.read<AddressCubit>().cityNameSelectedValue =
                      newVal;
                },
                itemBuilder: (item) {
                  return Text(item);
                },
              ),
              MyDropdownFormField<String>(
                labelText: 'اسم الحي',
                validator: (v) {},
                items: context.read<AddressCubit>().areaNameOptions,
                onChanged: (newVal) {
                  context.read<AddressCubit>().areaNameSelectedValue =
                      newVal;
                },
                itemBuilder: (item) {
                  return Text(item);
                },
              ),
              MyDropdownFormField<String>(
                labelText: 'نوع المنزل',
                validator: (v) {},
                items: context.read<AddressCubit>().houseTypeOptions,
                onChanged: (newVal) {
                  context.read<AddressCubit>().houseTypeSelectedValue =
                      newVal;
                },
                itemBuilder: (item) {
                  return Text(item);
                },
              ),
              MyTextFormField(
                labelText: 'رقم المنزل',
                controller: TextEditingController(),
                validator: (v) {},
              ),
              MyTextFormField(
                maxLines: 6,
                labelText: 'معلم او مكان مميز قريب من عنوانك',
                controller: TextEditingController(),
                validator: (v) {},
              ),
              const VerticalSpacer(16),
              Row(
                children: [
                  Flexible(
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(8),
                      textStyle: MyTextStyles.font18Weight600
                          .copyWith(color: Colors.black),
                      text: 'السابق',
                      backGroundColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Close the dialog on button press
                      },
                    ),
                  ),
                  const Spacer(),
                  // Add some space between buttons
                  Flexible(
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(8),
                      textStyle: MyTextStyles.font18Weight600
                          .copyWith(color: Colors.white),
                      text: 'التالي',
                      backGroundColor: Colors.black,
                      onPressed: () {
                        context
                            .read<AddressCubit>()
                            .pageController
                            .nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
