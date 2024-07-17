import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/cubit/loader_cubit/loader_cubit.dart';
import 'package:test1/cubit/loader_cubit/loader_cubit.dart';
import 'package:test1/cubit/loader_cubit/loader_state.dart';
import 'package:test1/features/home/presentation/home_view_model.dart';
import 'package:test1/models/slider/slider_response.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/vertical_and_horizontal_space.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'components/custom_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/home/presentation/components/sevice_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'مرحباً بك عميلنا العزيز',
          leading: true,
          leadingPressed: () {},
        ),
        body: Stack(
          children: [
            BlocBuilder<LoaderCubit, LoaderState>(
                bloc: homeViewModel.loaderCubit,
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  else{
                    return Container();
                  }
                }),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCarousel(
                      sliderCubit: homeViewModel.sliderCubit,
                    ),
                    const VerticalSpacer(24),
                    Text(
                      "خدماتنا المميزة",
                      style: MyTextStyles.font16Weight600
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      "مجموعة خدمات لا غنى عنها",
                      style: MyTextStyles.font14Weight600
                          .copyWith(color: Colors.black),
                    ),
                    const VerticalSpacer(17),
                    ServiceCard(
                      title: 'خدمة بالساعة',
                      subTitle: 'خدمات منزلية بنظام الساعات',
                      onTap: () {
                        AppConstants.service = Service.hours;
                        context.pushNamed(AppRouter.servicePerHourView);
                      },
                    ),
                    const VerticalSpacer(20),
                    ServiceCard(
                      title: 'خدمة مقيمة',
                      subTitle: 'نظام الباقات الشهرية و السنوية',
                      onTap: () {
                        AppConstants.service = Service.resident;
                        context.pushNamed(AppRouter.selectAddressView);
                      },
                    ),
                    const VerticalSpacer(20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "نسعد بتواصلكم معنا من خلال",
                        style: MyTextStyles.font16Weight600
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const VerticalSpacer(23),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                            child: CircleAvatar(
                              radius: 17.5.h,
                              backgroundColor: Colors.grey,
                            ),
                          );
                        }))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
