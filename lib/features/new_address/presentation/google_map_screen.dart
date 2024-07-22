import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/new_address/presentation/google_maps_view_model.dart';
import 'package:test1/features/new_address/presentation/new_address_view_model.dart';
import 'package:test1/features/shared/next_button.dart';
import '../../../components/widgets/loader.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';

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
  GoogleMapsViewModel googleMapsViewModel = GoogleMapsViewModel();
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition kGoogle;
  final Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [];

  @override
  void initState() {
    points = widget.points;
    super.initState();
    kGoogle = CameraPosition(
      target: widget.points.first,
      zoom: 15,
    );
    _polygon.add(
      Polygon(
        polygonId: const PolygonId('1'),
        points: points,
        fillColor: Colors.green.withOpacity(0.3),
        strokeColor: Colors.green,
        geodesic: true,
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
                  BlocBuilder<GenericCubit, GenericState>(
                    bloc: googleMapsViewModel.googleMapsCubit,
                    builder: (context, state) {
                      return Expanded(
                        child: GoogleMap(
                          initialCameraPosition: kGoogle,
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          compassEnabled: true,
                          polygons: _polygon,
                          markers: googleMapsViewModel.markers,
                          // Add markers to the map
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                          onTap: (LatLng tappedPoint) {
                            if (googleMapsViewModel.isPointInPolygon(
                                tappedPoint, points)) {
                              googleMapsViewModel.addMarker(
                                  tappedPoint); // Add marker if within polygon
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'يجب اختيار نقطة داخل المنطقة المحددة')),
                              );
                            }
                          },
                        ),
                      );
                    },
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