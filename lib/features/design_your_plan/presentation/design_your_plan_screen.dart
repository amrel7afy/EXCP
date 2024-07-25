import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/components/widgets/read_only_text_form_field.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/design_your_plan/presentation/design_your_plan_view_model.dart';

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
  DesignYourPlanViewModel designYourPlanViewModel =
  DesignYourPlanViewModel.instance();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    designYourPlanViewModel.clearControllers();
    designYourPlanViewModel.fetchDataOfFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'صمم باقتك',
          leadingPressed: () {
            context.pop();
          },
        ),
        body: BlocBuilder<GenericCubit, GenericState>(
          bloc: designYourPlanViewModel.genericCubit,
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(27),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReadOnlyDropdownFormField(
                          hint: 'اختر الجنسية',
                          labelText: 'الجنسية',
                          controller:
                          designYourPlanViewModel.nationalityController,
                          validator: designYourPlanViewModel.validateDropdown,
                          itemBuilder: (item) {
                            return Text(item.toString());
                          },
                          onChanged: designYourPlanViewModel.updateNationalitySelected,
                          items: designYourPlanViewModel.nationality,
                        ),
                        ReadOnlyDropdownFormField(
                          hint: 'اختر عدد العاملات',
                          labelText: 'عدد العاملات',
                          controller: designYourPlanViewModel.numberOfWorkersController,
                          validator: designYourPlanViewModel.validateDropdown,
                          itemBuilder: (item) {
                            return Text(item.toString());
                          },
                          onChanged: designYourPlanViewModel.updateNumberOfWorkersSelected,
                          items: designYourPlanViewModel.numberOfWorkers,
                        ),
                        ReadOnlyDropdownFormField(
                          hint: 'اختر مدة التعاقد',
                          labelText: 'مدة التعاقد',
                          controller: designYourPlanViewModel.contractDurationController,
                          validator: designYourPlanViewModel.validateDropdown,
                          itemBuilder: (item) {
                            return Text(item.toString());
                          },
                          onChanged: designYourPlanViewModel.updateContractDurationSelected,
                          items: designYourPlanViewModel.contractDuration,
                        ),
                        ReadOnlyDropdownFormField(
                          hint: 'اختر الفترات',
                          labelText: 'الفترات',
                          controller: designYourPlanViewModel.durationController,
                          validator: designYourPlanViewModel.validateDropdown,
                          itemBuilder: (item) {
                            return Text(item.toString());
                          },
                          onChanged: designYourPlanViewModel.updateDurationSelected,
                          items: designYourPlanViewModel.duration,
                        ),
                        const AppointmentDetails(),
                        const VerticalSpacer(15),
                        ReadOnlyDropdownFormField(
                          hint: 'اختر توقيت الزيارة',
                          labelText: 'توقيت الزيارة',
                          controller: designYourPlanViewModel.intervalsController,
                          validator: designYourPlanViewModel.validateDropdown,
                          itemBuilder: (item) {
                            return Text(item.toString());
                          },
                          onChanged: designYourPlanViewModel.updateIntervalsSelected,
                          items: designYourPlanViewModel.intervals,
                        ),
                        ReadOnlyDropdownFormField(
                          hint: 'اختر عدد الزيارات',
                          labelText: 'عدد الزيارات',
                          controller: designYourPlanViewModel.numberOfVisitsController,
                          validator: designYourPlanViewModel.validateDropdown,
                          itemBuilder: (item) {
                            return Text(item.toString());
                          },
                          onChanged: designYourPlanViewModel.updateNumberOfVisitsSelected,
                          items: designYourPlanViewModel.numberOfVisits,
                        ),
                        MyTextFormField(
                          readOnly: true,
                          labelText: 'تاريخ اول زيارة',
                          controller: designYourPlanViewModel
                              .dateOfFirstVisitController,
                          validator: (validator) {},
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
                              if (_formKey.currentState!.validate()) {
                                context.pushNamed(AppRouter.contractInfoView);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  @override
  void dispose() {

    super.dispose();
  }
}
