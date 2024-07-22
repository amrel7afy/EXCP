import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/shared/next_button.dart';

import '../../../components/widgets/loader.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import 'components/custom_google_map_widget.dart';

class PolygonMapScreen extends StatefulWidget {
  final List<LatLng> points;

  const PolygonMapScreen({
    super.key,
    required this.points,
  });

  @override
  State<PolygonMapScreen> createState() => _PolygonMapScreenState();
}

class _PolygonMapScreenState extends State<PolygonMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'إضافة عنوان جديد',
        ),
        body: Stack(
          children: [
            const Loader(),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomGoogleMap(
                    points: widget.points,
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
                          onPressed: () {},
                        ),
                      ),
                      const Spacer(flex: 3),
                      Expanded(
                        flex: 7,
                        child: NextButton(onTap: () {
                          if (AppConstants.service == Service.hours) {
                            context.pushReplacementNamed(
                                AppRouter.selectYourPlanView);
                          } else if (AppConstants.service == Service.resident) {
                            context.pushReplacementNamed(
                                AppRouter.residentServiceView);
                          }
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
