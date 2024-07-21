import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:math';
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

  const PolygonMapScreen({super.key, required this.points});

  @override
  State<PolygonMapScreen> createState() => _PolygonMapScreenState();
}

class _PolygonMapScreenState extends State<PolygonMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition kGoogle;
  final Set<Polygon> _polygon = HashSet<Polygon>();
  final Set<Marker> _markers = HashSet<Marker>(); // Set to hold markers
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

  bool _isPointInPolygon(LatLng point, List<LatLng> polygon) {
    int intersections = 0;
    for (int i = 0; i < polygon.length; i++) {
      LatLng vertex1 = polygon[i];
      LatLng vertex2 = polygon[(i + 1) % polygon.length];

      if (vertex1.longitude == vertex2.longitude &&
          point.longitude == vertex1.longitude &&
          point.latitude >= min(vertex1.latitude, vertex2.latitude) &&
          point.latitude <= max(vertex1.latitude, vertex2.latitude)) {
        return true;
      }

      if (point.longitude > min(vertex1.longitude, vertex2.longitude) &&
          point.longitude <= max(vertex1.longitude, vertex2.longitude) &&
          point.latitude <= max(vertex1.latitude, vertex2.latitude) &&
          vertex1.longitude != vertex2.longitude) {
        double intersectionLat = (point.longitude - vertex1.longitude) *
            (vertex2.latitude - vertex1.latitude) /
            (vertex2.longitude - vertex1.longitude) +
            vertex1.latitude;
        if (vertex1.latitude == vertex2.latitude || point.latitude <= intersectionLat) {
          intersections++;
        }
      }
    }
    return intersections % 2 != 0;
  }

  void _addMarker(LatLng tappedPoint) {
    setState(() {
      _markers.clear(); // Clear previous markers if you want only one marker at a time
      _markers.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          infoWindow: InfoWindow(
            title: 'Selected Location',
            snippet: '${tappedPoint.latitude}, ${tappedPoint.longitude}',

          ),
        ),
      );
    });
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
                      initialCameraPosition: kGoogle,
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      compassEnabled: true,
                      polygons: _polygon,
                      markers: _markers, // Add markers to the map
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      onTap: (LatLng tappedPoint) {
                        if (_isPointInPolygon(tappedPoint, points)) {
                          _addMarker(tappedPoint); // Add marker if within polygon
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('يجب اختيار نقطة داخل المنطقة المحددة')),
                          );
                        }
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
                          textStyle: MyTextStyles.font18Weight500.copyWith(color: Colors.black),
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
                            context.pushReplacementNamed(AppRouter.selectYourPlanView);
                          } else if (AppConstants.service == Service.resident) {
                            context.pushReplacementNamed(AppRouter.residentServiceView);
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
