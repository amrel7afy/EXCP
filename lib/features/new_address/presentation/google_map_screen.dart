import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/widgets/show_alert_dialog.dart';
import 'package:test1/features/new_address/presentation/new_address_view_model.dart';
import 'package:test1/features/shared/next_button.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../shared/back_button.dart';
import 'components/custom_google_map_widget.dart';
import 'google_maps_view_model.dart';

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
  NewAddressViewModel newAddressViewModel = NewAddressViewModel();

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
                      MyBackButton(
                        onTap: () {

                        },
                      ),
                      const Spacer(flex: 3),
                      NextButton(onTap: () {
                        if (GoogleMapsViewModel.markers.isNotEmpty) {
                          newAddressViewModel.addNewAddress(context);
                        } else {
                          showAlertDialog(context,
                              const Text('برجاء إختيار العنوان على الخريطة'));
                        }
                      }),
                    ],
                  ),
                ],
              ),
            ),
           // const Loader(),
          ],
        ),
      ),
    );
  }
}
