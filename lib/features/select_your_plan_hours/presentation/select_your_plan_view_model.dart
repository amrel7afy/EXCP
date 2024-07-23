import 'package:flutter/material.dart';

import '../../../cubit/generic_cubit/generic_cubit.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';

class SelectYourPlanViewModel {
  SelectYourPlanViewModel._();

  // Static instance
  static final SelectYourPlanViewModel _instance = SelectYourPlanViewModel._();

  // Factory constructor to return the same instance
  factory SelectYourPlanViewModel.instance() {
    return _instance;
  }

  bool is4Hours = true;
  bool isFrom8AM = true;
  bool isAM = true;
  Loading loading = Loading.instance();
  late TabController tabController;

  GenericCubit genericCubit = GenericCubit();


}
