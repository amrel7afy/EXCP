import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/new_address/presentation/new_address_view_model.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_state.dart';
import '../../../../core/widgets/custom_button.dart';

class AddressOnTheMapViewPage extends StatefulWidget {
  final NewAddressViewModel newAddressViewModel;
   const AddressOnTheMapViewPage({super.key,required this.newAddressViewModel});

  @override
  State<AddressOnTheMapViewPage> createState() =>
      _AddressOnTheMapViewPageState();
}

class _AddressOnTheMapViewPageState extends State<AddressOnTheMapViewPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey,
                  ),
                ),
              ),
              const VerticalSpacer(21),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(8),
                      textStyle: MyTextStyles.font18Weight500
                          .copyWith(color: Colors.black),
                      text: 'السابق',
                      backGroundColor: Colors.white,
                      onPressed: () {

                            widget.newAddressViewModel.pageController
                            .previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                      },
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  // Add some space between buttons
                  Expanded(
                    flex: 11,
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(8),
                      textStyle: MyTextStyles.font18Weight500
                          .copyWith(color: Colors.white),
                      text: 'حفظ واستكمال',
                      backGroundColor: Colors.black,
                      onPressed: () {
                        if (AppConstants.service == Service.hours) {
                          context.pushReplacementNamed(
                              AppRouter.selectYourPlanView);
                        } else if (AppConstants.service == Service.resident) {
                          context.pushReplacementNamed(
                              AppRouter.residentServiceView);
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
