import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test1/components/widgets/read_only_text_form_field.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/design_your_plan/presentation/design_your_plan_view_model.dart';

import '../../../components/widgets/loader.dart';
import '../../../core/AppRouter.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/vertical_and_horizontal_space.dart';
import '../../../core/theming/my_colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/syncfusion_calendar.dart';
import '../../shared/my_text_form_field.dart';
import '../../shared/next_button.dart';
import 'components/appointment_details.dart';

class DesignYourOfferView extends StatefulWidget {
  const DesignYourOfferView({super.key});

  @override
  State<DesignYourOfferView> createState() => _DesignYourOfferViewState();
}

class _DesignYourOfferViewState extends State<DesignYourOfferView> {
  final DesignYourPlanViewModel designYourPlanViewModel =
      DesignYourPlanViewModel.instance();

  @override
  void initState() {
    designYourPlanViewModel.clearFields();
    designYourPlanViewModel.fetchDataOfFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Directionality(
          textDirection: AppConstants.appTextDirection,
          child: Scaffold(
              appBar: const CustomAppBar(
                title: 'صمم باقتك',
              ),
              body: BlocBuilder<GenericCubit, GenericState>(
                bloc: designYourPlanViewModel.genericCubit,
                builder: (context, state) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReadOnlyDropdownFormField(
                              hint: designYourPlanViewModel.nationalityHint,
                              labelText: 'الجنسية',
                              items: designYourPlanViewModel.nationality,
                              cubit: designYourPlanViewModel.nationalityCubit,
                            ),
                            ReadOnlyDropdownFormField(
                              hint: 'اختر عدد العاملات',
                              labelText: 'عدد العاملات',
                              items: designYourPlanViewModel.numberOfWorkers,
                              cubit:
                                  designYourPlanViewModel.numberOfWorkersCubit,
                            ),
                            ReadOnlyDropdownFormField(
                                hint: 'اختر مدة التعاقد',
                                labelText: 'مدة التعاقد',
                                items: designYourPlanViewModel.contractDuration,
                                cubit: designYourPlanViewModel
                                    .contractDurationCubit),
                            ReadOnlyDropdownFormField(
                                hint: 'اختر الفترات',
                                labelText: 'الفترات',
                                items: designYourPlanViewModel.shifts,
                                cubit: designYourPlanViewModel.shiftsCubit),
                            const AppointmentDetails(),
                            const VerticalSpacer(15),
                            ReadOnlyDropdownFormField(
                              hint: 'اختر توقيت الزيارة',
                              labelText: 'توقيت الزيارة',
                              cubit:
                                  designYourPlanViewModel.numberOfVisitsCubit,
                              items: designYourPlanViewModel.intervals,
                            ),
                            ReadOnlyDropdownFormField(
                                hint: 'اختر عدد الزيارات',
                                labelText: 'عدد الزيارات',
                                items: designYourPlanViewModel.numberOfVisits,
                                cubit: designYourPlanViewModel
                                    .numberOfVisitsCubit),
                            MyTextFormField(
                              readOnly: true,
                              labelText: 'تاريخ اول زيارة',
                              controller: designYourPlanViewModel
                                  .dateOfFirstVisitController,
                              validator: (value) {},
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today_outlined,
                                    size: 20, color: MyColors.kPrimaryColor),
                                onPressed: () {
                                  showCalendarDialog(context)?.day.toString();
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: NextButton(
                                onTap: () {
                                  designYourPlanViewModel.validateFields();
                                  log(designYourPlanViewModel
                                      .contractDurationCubit.state.data
                                      .toString());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
        const Loader(),
      ],
    );
  }
}
