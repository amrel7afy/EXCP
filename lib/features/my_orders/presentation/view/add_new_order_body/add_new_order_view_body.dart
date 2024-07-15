import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_state.dart';
import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../shared/my_text_form_field.dart';

class AddNewOrderViewBody extends StatelessWidget {
  const AddNewOrderViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyDropdownFormField<String>(
                      labelText: 'مدينة الإقامة',
                      validator: (v) {},
                      value: context.read<AddressCubit>().cityNameOptions.first,
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
                      value: context.read<AddressCubit>().areaNameOptions.first,
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
                      value:
                          context.read<AddressCubit>().houseTypeOptions.first,
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
                      labelText: 'رقم الجوال',
                      controller: TextEditingController(),
                      validator: (v) {},
                      hint: 'رقم الجوال',
                      hintStyle: MyTextStyles.font12Weight500
                          .copyWith(color: MyColors.kPrimaryColor),
                    ),
                    MyTextFormField(
                      maxLines: 6,
                      labelText: 'تفاصيل الطلب',
                      controller: TextEditingController(),
                      validator: (v) {},
                      hint: 'تفاصيل الطلب',
                      hintStyle: MyTextStyles.font12Weight500
                          .copyWith(color: MyColors.kPrimaryColor),
                    ),
                    const VerticalSpacer(16),
                    SizedBox(
                      width: getWidth(context) * 0.4,
                      child: CustomButton(
                        textStyle: MyTextStyles.font18Weight500
                            .copyWith(color: Colors.white),
                        text: 'إرسال الطلب',
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
