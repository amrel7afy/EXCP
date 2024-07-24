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
import 'components/number_of_workers.dart';

class DesignYourOfferView extends StatefulWidget {
  const DesignYourOfferView({super.key});

  @override
  State<DesignYourOfferView> createState() => _DesignYourOfferViewState();
}

class _DesignYourOfferViewState extends State<DesignYourOfferView> {
  DesignYourPlanViewModel designYourPlanViewModel=DesignYourPlanViewModel.instance();
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
        body:  SafeArea(child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyDropdownFormField(
                    labelText: 'الجنسية',
                    items: designYourPlanViewModel.nationality,
                    value: designYourPlanViewModel.nationality.first,
                    onChanged: (newVal) {},
                    itemBuilder: (item) {
                      return Text(item);
                    },
                    validator: (validator) {
                      return null;
                    }),
                NumberOfWorkers(),
                MyDropdownFormField(
                    labelText: 'مدة التعاقد',
                    items: designYourPlanViewModel.contractDuration,
                    value: designYourPlanViewModel.contractDuration.first,
                    onChanged: (newVal) {},
                    itemBuilder: (item) {
                      return Text(item);
                    },
                    validator: (validator) {
                      return null;
                    }),
                MyDropdownFormField(
                    labelText: 'الفترات',
                    items: designYourPlanViewModel.duration,
                    value: designYourPlanViewModel.duration.first,
                    onChanged: (newVal) {},
                    itemBuilder: (item) {
                      return Text(item);
                    },
                    validator: (validator) {
                      return null;
                    }),
                const AppointmentDetails(),
                const VerticalSpacer(15),
                MyDropdownFormField(
                  labelText: 'توقيت الزيارة',
                  items: designYourPlanViewModel.intervals,
                  value: designYourPlanViewModel.intervals.first,
                  onChanged: (newVal) {},
                  itemBuilder: (item) {
                    return Text(item);
                  },
                  validator: (validator) {
                    return null;
                  },
                ),
                MyDropdownFormField(
                  labelText: 'عدد الزيارات',
                  items: designYourPlanViewModel.numberOfVisits,
                  onChanged: (newVal) {},
                  value: designYourPlanViewModel.numberOfVisits.first,
                  itemBuilder: (item) {
                    return Text(item);
                  },
                  validator: (validator) {
                    return null;
                  },
                ),
                MyTextFormField(
                  labelText: 'تاريخ اول زيارة',
                  controller: designYourPlanViewModel.dateOfFirstVisitController,
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
                      context.pushNamed(AppRouter.contractInfoView);
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
