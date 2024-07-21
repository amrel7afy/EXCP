import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/new_address/presentation/new_address_view_model.dart';
import 'package:test1/features/shared/next_button.dart';

import '../../../components/widgets/loader.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';

class PolygonMapScreen extends StatefulWidget {
  final List<LatLng> points;


  const PolygonMapScreen({super.key,  required this.points});

  @override
  State<PolygonMapScreen> createState() =>
      _PolygonMapScreenState();
}

class _PolygonMapScreenState extends State<PolygonMapScreen> {
  // created controller to display Google Maps
  final Completer<GoogleMapController> _controller = Completer();

// on below line we have set the camera position
 late  CameraPosition kGoogle ;

  final Set<Polygon> _polygon = HashSet<Polygon>();

// created list of locations to display polygon
  List<LatLng> points=[];

  @override
  void initState() {
    points=widget.points;
    super.initState();
    kGoogle=  CameraPosition(
      target: widget.points.first,
      zoom: 15,
    );
    //initialize polygon
    _polygon.add(
      Polygon(
        // given polygonId
        polygonId: const PolygonId('1'),
        // initialize the list of points to display polygon
        points: points,
        // given color to polygon
        fillColor: Colors.green.withOpacity(0.3),
        // given border color to polygon
        strokeColor: Colors.green,
        geodesic: true,
        // given width of border
        strokeWidth: 4,
      ),
    );
  }

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
                    Expanded(
                      child: GoogleMap(
                        //given camera position
                        initialCameraPosition: kGoogle,
                        // on below line we have given map type
                        mapType: MapType.normal,
                        // on below line we have enabled location
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        // on below line we have enabled compass location
                        compassEnabled: true,
                        // on below line we have added polygon
                        polygons: _polygon,
                        // displayed google map
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
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
                            onPressed: () {},
                          ),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        // Add some space between buttons
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
                       )
                      ],
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );;
  }
}


