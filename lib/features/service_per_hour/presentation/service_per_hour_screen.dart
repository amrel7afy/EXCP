import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/features/home/presentation/home_screen.dart';
import 'package:test1/features/service_per_hour/presentation/components/loading_content.dart';
import 'package:test1/features/service_per_hour/presentation/service_per_hour_view_model.dart';
import 'package:test1/models/service_per_hour/service_class.dart';
import '../../../components/widgets/shimmer.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/vertical_and_horizontal_space.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/show_alert_dialog.dart';
import '../../../cubit/generic_cubit/generic_state.dart';
import '../../home/presentation/components/home_service_card.dart';
import 'components/service_alert_dialog_content.dart';
import 'components/service_per_hour_card.dart';

class ServicePerHourScreen extends StatefulWidget {
  const ServicePerHourScreen({super.key});

  @override
  State<ServicePerHourScreen> createState() => _ServicePerHourScreenState();
}

class _ServicePerHourScreenState extends State<ServicePerHourScreen> {
  ServicePerHourViewModel servicePerHourViewModel = ServicePerHourViewModel();

  @override
  void initState() {
    servicePerHourViewModel.fetchServicePerHour();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Directionality(
          textDirection: AppConstants.appTextDirection,
          child: Scaffold(
            appBar: const CustomAppBar(
              title: 'اختر الخدمة',
              leading: true,
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: BlocBuilder<GenericCubit<List<ServiceModel>>,
                    GenericState<List<ServiceModel>>>(
                  bloc: servicePerHourViewModel.serviceCubit,
                  builder: (context, state) {
                    if (state is GenericUpdate) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "اختر الخدمة المطلوبة",
                            style: MyTextStyles.font18Weight600
                                .copyWith(color: Colors.black),
                          ),
                          const VerticalSpacer(17),
                          ServiceCard(
                            service: state.data![0],
                            onTap: () {
                              showAlertDialog(
                                  context, const ServiceAlertDialogContent());
                            },
                          ),
                          const VerticalSpacer(20),
                          ServiceCard(
                            onTap: () {
                              showAlertDialog(
                                  context, const ServiceAlertDialogContent());
                            },
                            service: state.data![1],
                          ),
                          const VerticalSpacer(20),
                        ],
                      );
                    }
                    else {
                      return const ShimmerLoading(
                      children: LoadingContent(),
                    );
                    }

                  },
                ),
              ),
            )),
          ),
        ),
        Loader(loading: servicePerHourViewModel.loading),
      ],
    );
  }
}

