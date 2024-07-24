import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/design_your_plan/presentation/design_your_plan_view_model.dart';

import '../../../core/AppRouter.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/vertical_and_horizontal_space.dart';
import '../../../core/theming/my_colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/drop_down_floating_label_form_field.dart';
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(27),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyDropdownFormField<String>(
                      labelText: 'الجنسية',
                      items: designYourPlanViewModel.nationality,
                      //value: designYourPlanViewModel.nationalitySelected,
                      onChanged: (newVal) {
                        designYourPlanViewModel
                            .updateNationalitySelected(newVal);
                      },
                      itemBuilder: (item) {
                        return Text(item);
                      },
                      validator: designYourPlanViewModel.validateDropdown,
                    ),
                    MyDropdownFormField<String>(
                      labelText: 'عدد العاملات',
                      items: designYourPlanViewModel.numberOfWorkers,
                      //value: designYourPlanViewModel.numberOfWorkersSelected,
                      onChanged: (newVal) {
                        designYourPlanViewModel
                            .updateNumberOfWorkersSelected(newVal);
                      },
                      itemBuilder: (item) {
                        return Text(item);
                      },
                      validator: designYourPlanViewModel.validateDropdown,
                    ),
                    MyDropdownFormField<String>(
                      labelText: 'مدة التعاقد',
                      items: designYourPlanViewModel.contractDuration,
                      //value: designYourPlanViewModel.contractDurationSelected,
                      onChanged: (newVal) {
                        designYourPlanViewModel
                            .updateContractDurationSelected(newVal);
                      },
                      itemBuilder: (item) {
                        return Text(item);
                      },
                      validator: designYourPlanViewModel.validateDropdown,
                    ),
                    MyDropdownFormField<String>(
                      labelText: 'الفترات',
                      items: designYourPlanViewModel.duration,
                      //value: designYourPlanViewModel.durationSelected,
                      onChanged: (newVal) {
                        designYourPlanViewModel.updateDurationSelected(newVal);
                      },
                      itemBuilder: (item) {
                        return Text(item);
                      },
                      validator: designYourPlanViewModel.validateDropdown,
                    ),
                    const AppointmentDetails(),
                    const VerticalSpacer(15),
                    MyDropdownFormField<String>(
                      labelText: 'توقيت الزيارة',
                      items: designYourPlanViewModel.intervals,
                      //value: designYourPlanViewModel.intervalsSelected,
                      onChanged: (newVal) {
                        designYourPlanViewModel.updateIntervalsSelected(newVal);
                      },
                      itemBuilder: (item) {
                        return Text(item);
                      },
                      validator: designYourPlanViewModel.validateDropdown,
                    ),
                    MyDropdownFormField<String>(
                      labelText: 'عدد الزيارات',
                      items: designYourPlanViewModel.numberOfVisits,
                      value: designYourPlanViewModel.numberOfVisitsSelected,
                      onChanged: (newVal) {
                        designYourPlanViewModel
                            .updateNumberOfVisitsSelected(newVal);
                      },
                      itemBuilder: (item) {
                        return Text(item);
                      },
                      validator: designYourPlanViewModel.validateDropdown,
                    ),
                    MyTextFormField(
                      labelText: 'تاريخ اول زيارة',
                      controller:
                          designYourPlanViewModel.dateOfFirstVisitController,
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
        ),
      ),
    );
  }
}
