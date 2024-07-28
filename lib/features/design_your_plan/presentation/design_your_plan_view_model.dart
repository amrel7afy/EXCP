import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/loader_cubit/loader_cubit.dart';

import '../../../controller/hourly_contract/hourly_contract_controller.dart';
import '../../../controller/resource_group/resource_group_controller.dart';

class DesignYourPlanViewModel {
  DesignYourPlanViewModel._();

  // Static instance
  static final DesignYourPlanViewModel _instance = DesignYourPlanViewModel._();

  // Factory constructor to return the same instance
  factory DesignYourPlanViewModel.instance() {
    return _instance;
  }

  TextEditingController dateOfFirstVisitController = TextEditingController();

  String nationalityHint = 'اختر الجنسية';
  List<String> nationality = [];
  List<String> numberOfWorkers = [];
  List<String> contractDuration = [];
  List<String> duration = [];
  List<String> intervals = [];
  List<String> numberOfVisits = [];

  GenericCubit<String> nationalityCubit = GenericCubit<String>(data: AppConstants.initState);
  GenericCubit<String> numberOfWorkersCubit = GenericCubit<String>(data: AppConstants.initState);
  GenericCubit<String> contractDurationCubit = GenericCubit<String>(data: AppConstants.initState);
  GenericCubit<String> durationCubit = GenericCubit<String>(data: AppConstants.initState);
  GenericCubit<String> intervalsCubit = GenericCubit<String>(data: AppConstants.initState);
  GenericCubit<String> numberOfVisitsCubit = GenericCubit<String>(data: AppConstants.initState);

  GenericCubit<bool> nationalityBorderCubit = GenericCubit<bool>(data: true);
  GenericCubit<bool> numberOfWorkersBorderCubit = GenericCubit<bool>(data: true);
  GenericCubit<bool> contractDurationBorderCubit = GenericCubit<bool>(data: true);
  GenericCubit<bool> durationBorderCubit = GenericCubit<bool>(data: true);
  GenericCubit<bool> intervalsBorderCubit = GenericCubit<bool>(data: true);
  GenericCubit<bool> numberOfVisitsBorderCubit = GenericCubit<bool>(data: true);
  GenericCubit genericCubit = GenericCubit();
  Loading loading=Loading.instance();

  fetchDataOfFields() async {
    loading.show;
    List results = await Future.wait([
      ResourceGroupController.fetchGetResourceGroupsByService(),
      HourlyContractController.fetchKeyAndValueData(action: 'NumOfWorkers'),
      HourlyContractController.fetchKeyAndValueData(action: 'ContractDuration'),
      HourlyContractController.fetchKeyAndValueData(action: 'Shifts'),
      HourlyContractController.fetchKeyAndValueData(action: 'NumOfVisits'),
      HourlyContractController.fetchKeyAndValueData(action: 'NumOfHours'),
    ]);

    nationality = List<String>.from(results[0].map((item) => item.value).toList());
    numberOfWorkers = List<String>.from(results[1].map((item) => item.value).toList());
    contractDuration = List<String>.from(results[2].map((item) => item.value).toList());
    duration = List<String>.from(results[3].map((item) => item.value).toList());
    intervals = List<String>.from(results[4].map((item) => item.value).toList());
    numberOfVisits = List<String>.from(results[5].map((item) => item.value).toList());
    loading.hide;
    genericCubit.update();
  }



  void clearFields() {
    nationalityCubit.update(AppConstants.initState);
    numberOfWorkersCubit.update(AppConstants.initState);
    contractDurationCubit.update(AppConstants.initState);
    durationCubit.update(AppConstants.initState);
    intervalsCubit.update(AppConstants.initState);
    numberOfVisitsCubit.update(AppConstants.initState);
    dateOfFirstVisitController.clear();
  }


  void validateFields() {
    if (nationalityCubit.state.data.isNullOrEmpty() ||
        nationalityCubit.state.data == AppConstants.initState) {
      nationalityCubit.update(AppConstants.notValidatedState);
    }

    if (numberOfWorkersCubit.state.data.isNullOrEmpty() ||
        numberOfWorkersCubit.state.data == AppConstants.initState) {
      numberOfWorkersCubit.update(AppConstants.notValidatedState);
    }

    if (contractDurationCubit.state.data.isNullOrEmpty() ||
        contractDurationCubit.state.data == AppConstants.initState) {
      contractDurationCubit.update(AppConstants.notValidatedState);
    }

    if (durationCubit.state.data.isNullOrEmpty() ||
        durationCubit.state.data == AppConstants.initState) {
      durationCubit.update(AppConstants.notValidatedState);
    }

    if (intervalsCubit.state.data.isNullOrEmpty() ||
        intervalsCubit.state.data == AppConstants.initState) {
      intervalsCubit.update(AppConstants.notValidatedState);
    }

    if (numberOfVisitsCubit.state.data.isNullOrEmpty() ||
        numberOfVisitsCubit.state.data == AppConstants.initState) {
      numberOfVisitsCubit.update(AppConstants.notValidatedState);
    }
  }
}

