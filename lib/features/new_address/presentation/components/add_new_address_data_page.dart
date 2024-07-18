import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/models/city/city_model.dart';

import '../../../../components/widgets/loader.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../shared/my_text_form_field.dart';
import '../new_address_view_model.dart';

class AddNewAddressPage extends StatefulWidget {
  final NewAddressViewModel newAddressViewModel;

  const AddNewAddressPage({super.key, required this.newAddressViewModel});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  @override
  void initState() {
    super.initState();
    widget.newAddressViewModel.fetchActiveCities();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Loader(),
        Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<GenericCubit<List<CityModel>>,
                    GenericState<List<CityModel>>>(
                  bloc: widget.newAddressViewModel.cityCubit,
                  builder: (context, state) {
                    return MyDropdownFormField<String>(
                      labelText: 'مدينة الإقامة',
                      onItemTap: () async {
                        await widget.newAddressViewModel.fetchDistrictsOfCity(
                            cityId: '629a2a15-14fa-e911-a81f-000d3abaded5');
                      },
                      items: widget.newAddressViewModel.cityNames,
                      value: widget.newAddressViewModel.cityNameSelectedValue,
                      onChanged: (newVal) {
                        widget.newAddressViewModel.cityNameSelectedValue =
                            newVal;

                      },
                      itemBuilder: (item) {
                        return Text(item);
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء اختيار مدينة الإقامة';
                        }
                        return null;
                      },
                    );
                  },
                ),
                BlocBuilder<GenericCubit<List<CityModel>>,
                    GenericState<List<CityModel>>>(
                  bloc: widget.newAddressViewModel.districtCubit,
                  builder: (context, state) {
                    return MyDropdownFormField<String>(
                      labelText: 'اسم الحي',
                      validator: (v) {
                        return null;
                      },
                      items: widget.newAddressViewModel.districts!,
                      value: widget.newAddressViewModel.areaNameSelectedValue,
                      onChanged: (newVal) {
                        widget.newAddressViewModel.areaNameSelectedValue =
                            newVal;
                      },
                      itemBuilder: (item) {
                        return Text(item);
                      },
                    );
                  },
                ),
                MyDropdownFormField<String>(
                  labelText: 'نوع المنزل',
                  validator: (v) =>
                      v == null ? 'الرجاء اختيار نوع المنزل' : null,
                  items: widget.newAddressViewModel.houseTypeOptions,
                  value: widget.newAddressViewModel.houseTypeSelectedValue,
                  onChanged: (newVal) {
                    setState(() {
                      widget.newAddressViewModel.houseTypeSelectedValue =
                          newVal;
                    });
                  },
                  itemBuilder: (item) {
                    return Text(item);
                  },
                ),
                if (widget.newAddressViewModel.houseTypeSelectedValue ==
                    'عمارة')
                  MyDropdownFormField<String>(
                    labelText: 'الطابق',
                    validator: (v) => v == null ? 'الرجاء اختيار الطابق' : null,
                    items: widget.newAddressViewModel.floorOptions,
                    value: widget.newAddressViewModel.floorSelectedValue,
                    onChanged: (newVal) {
                      widget.newAddressViewModel.floorSelectedValue = newVal;
                    },
                    itemBuilder: (item) {
                      return Text(item);
                    },
                  ),
                MyTextFormField(
                  labelText: 'رقم المنزل',
                  controller: TextEditingController(),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'الرجاء إدخال رقم المنزل' : null,
                ),
                MyTextFormField(
                  maxLines: 6,
                  labelText: 'معلم او مكان مميز قريب من عنوانك',
                  controller: TextEditingController(),
                  validator: (v) => v == null || v.isEmpty
                      ? 'الرجاء إدخال معلم أو مكان مميز'
                      : null,
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: CustomButton(
                        borderRadius: BorderRadius.circular(8),
                        textStyle: MyTextStyles.font18Weight600
                            .copyWith(color: Colors.white),
                        text: 'التالي',
                        backGroundColor: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
