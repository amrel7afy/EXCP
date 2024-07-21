
import 'package:flutter/material.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import '../../../../shared/my_text_form_field.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/widgets/syncfusion_calendar.dart';
import 'appointment_details.dart';
import 'number_of_workers.dart';

class DesignYourOfferViewBody extends StatefulWidget {
  const DesignYourOfferViewBody({super.key});

  @override
  State<DesignYourOfferViewBody> createState() =>
      _DesignYourOfferViewBodyState();
}

class _DesignYourOfferViewBodyState extends State<DesignYourOfferViewBody> {
  List<String> nationality = ['المجر', 'الفلبين', 'اندونيسيا'];
  List<String> contractDuration = ['3 شهور', '5 شهور'];
  List<String> duration = ['صباحي', 'مسائي'];
  List<String> intervals = ['من 8ص الي 10ص', 'من 10ص الي 12ص'];
  List<String> numberOfVisits = ['1', '2', '3', '4', '5'];

  TextEditingController dateOfFirstVisitController =
      TextEditingController(text: 'اختر');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyDropdownFormField(
                labelText: 'الجنسية',
                items: nationality,
                value: nationality.first,
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            NumberOfWorkers(),
            MyDropdownFormField(
                labelText: 'مدة التعاقد',
                items: contractDuration,
                value: contractDuration.first,
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            MyDropdownFormField(
                labelText: 'الفترات',
                items: duration,
                value: duration.first,
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            const AppointmentDetails(),
            const VerticalSpacer(15),
            MyDropdownFormField(
              labelText: 'توقيت الزيارة',
              items: intervals,
              value: intervals.first,
              onChanged: (newVal) {},
              itemBuilder: (item) {
                return Text(item);
              },
              validator: (validator) {},
            ),
            MyDropdownFormField(
              labelText: 'عدد الزيارات',
              items: numberOfVisits,
              onChanged: (newVal) {},
              value: numberOfVisits.first,
              itemBuilder: (item) {
                return Text(item);
              },
              validator: (validator) {},
            ),
            MyTextFormField(
              labelText: 'تاريخ اول زيارة',
              controller: dateOfFirstVisitController,
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
              child: CustomButton(
                width: getWidth(context) * 0.3,
                borderRadius: BorderRadius.circular(8),
                textStyle:
                    MyTextStyles.font18Weight600.copyWith(color: Colors.white),
                text: 'التالي',
                backGroundColor: Colors.black,
                onPressed: ()  {
                  context.pushNamed(AppRouter.contractInfoView);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
