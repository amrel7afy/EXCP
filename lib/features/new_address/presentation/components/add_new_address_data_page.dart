import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import '../../../../components/widgets/loader.dart';
import '../../../../models/city/city_model.dart';
import '../../../shared/my_text_form_field.dart';

import '../../../../core/widgets/custom_button.dart';
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
    widget.newAddressViewModel.fetchActiveCities();
    widget.newAddressViewModel.fetchCityDistricts(
        cityId: '629a2a15-14fa-e911-a81f-000d3abaded5');
    super.initState();
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
                  BlocBuilder<GenericCubit<List<String>>,
                      GenericState<List<String>>>(
                    bloc: widget.newAddressViewModel.cityCubit,
                    builder: (context, state) {
                      List<String>?cities = [];
                      if (state is GenericUpdate) {
                        cities = state.data;
                      }
                      return MyDropdownFormField<String>(
                        labelText: 'مدينة الإقامة',
                        validator: (v) {},
                        items: cities ?? [],
                        onChanged: (newVal) {
                          widget.newAddressViewModel.cityNameSelectedValue =
                              newVal;
                        },
                        itemBuilder: (item) {
                          return Text(item);
                        },
                      );
                    },
                  ),
                  MyDropdownFormField<String>(
                    //onItemTap:,
                    labelText: 'اسم الحي',
                    validator: (v) {},
                    items: widget.newAddressViewModel.areaNameOptions,
                    onChanged: (newVal) {
                      widget.newAddressViewModel.areaNameSelectedValue = newVal;
                    },
                    itemBuilder: (item) {
                      return Text(item);
                    },
                  ),
                  MyDropdownFormField<String>(
                    labelText: 'نوع المنزل',
                    validator: (v) {},
                    items: widget.newAddressViewModel.houseTypeOptions,
                    onChanged: (newVal) {
                      widget.newAddressViewModel.houseTypeSelectedValue =
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
                            widget.newAddressViewModel
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
            )),
      ],
    );
  }
}
