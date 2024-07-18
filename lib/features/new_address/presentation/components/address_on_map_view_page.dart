import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/new_address/presentation/new_address_view_model.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_state.dart';
import '../../../../core/widgets/custom_button.dart';

class AddressOnTheMapViewPage extends StatefulWidget {
  final NewAddressViewModel newAddressViewModel;

  const AddressOnTheMapViewPage({super.key, required this.newAddressViewModel});

  @override
  State<AddressOnTheMapViewPage> createState() =>
      _AddressOnTheMapViewPageState();
}

class _AddressOnTheMapViewPageState extends State<AddressOnTheMapViewPage> {
  // created controller to display Google Maps
  final Completer<GoogleMapController> _controller = Completer();

// on below line we have set the camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 10,
  );

  final Set<Polygon> _polygon = HashSet<Polygon>();

// created list of locations to display polygon
  List<LatLng> points = [
    const LatLng(19.0759837, 72.8776559),
    const LatLng(28.679079, 77.069710),
    const LatLng(26.850000, 80.949997),
    const LatLng(19.0759837, 72.8776559),
  ];

  @override
  void initState() {
    super.initState();
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
    return Padding(
      padding: const EdgeInsets.all(32),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GoogleMap(
                  //given camera position
                  initialCameraPosition: _kGoogle,
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
                    flex: 11,
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(8),
                      textStyle: MyTextStyles.font18Weight500
                          .copyWith(color: Colors.white),
                      text: 'حفظ واستكمال',
                      backGroundColor: Colors.black,
                      onPressed: () {
                        if (AppConstants.service == Service.hours) {
                          context.pushReplacementNamed(
                              AppRouter.selectYourPlanView);
                        } else if (AppConstants.service == Service.resident) {
                          context.pushReplacementNamed(
                              AppRouter.residentServiceView);
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
