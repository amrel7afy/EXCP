import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/new_address/presentation/google_maps_view_model.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    super.key,
    required this.points,
  });

  final List<LatLng> points;

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  GoogleMapsViewModel googleMapsViewModel = GoogleMapsViewModel.instance();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericState>(
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
            markers: GoogleMapsViewModel.markers,
            // Add markers to the map
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (LatLng tappedPoint) {
              if (googleMapsViewModel.isPointInPolygon(tappedPoint, points)) {
                googleMapsViewModel
                    .addMarker(tappedPoint); // Add marker if within polygon
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('يجب اختيار نقطة داخل المنطقة المحددة')),
                );
              }
            },
          ),
        );
      },
    );
  }
}
